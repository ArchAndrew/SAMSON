resource "azurerm_policy_definition" "required_tags" {
  name                = lower("${var.project}-${var.environment}-required-tags")
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "${var.project}-${var.environment} Required Tags"
  management_group_id = var.management_group_id

  metadata = jsonencode({
    category = "SAMSON Governance"
  })
policy_rule = jsonencode({
  if = {
    allOf = [
      {
        field = "type"
        notIn = [
          "Microsoft.SecurityInsights/*",
          "Microsoft.OperationsManagement/solutions"
        ]
      },
      {
        anyOf = [
          for tag in var.required_tags : {
            field  = "tags[${tag}]"
            exists = "false"
          }
        ]
      }
    ]
  }

  then = {
    effect = "deny"
  }
})
}

resource "azurerm_management_group_policy_set_definition" "samson_guardrails" {
  name                = lower("${var.project}-${var.environment}-policy-guardrails")
  policy_type         = "Custom"
  display_name        = "${var.project}-${var.environment} Policy Guardrails"
  management_group_id = var.management_group_id

  metadata = jsonencode({
    category = "SAMSON Governance"
  })

  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.required_tags.id
    reference_id         = "required-tags"
  }

  policy_definition_reference {
    policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"
    reference_id         = "allowed-locations"

    parameter_values = jsonencode({
      listOfAllowedLocations = {
        value = var.allowed_locations
      }
    })
  }
}

resource "azurerm_management_group_policy_assignment" "samson_guardrails" {
  name                 = lower("${var.project}-${var.environment}-guardrails")
  display_name         = "${var.project}-${var.environment} Guardrails"
  policy_definition_id = azurerm_management_group_policy_set_definition.samson_guardrails.id
  management_group_id  = var.management_group_id
}