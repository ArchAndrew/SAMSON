from src.risk_engine.control_mapper import map_controls


def test_access_key_control_mapping():
    controls = map_controls("CreateAccessKey")

    assert isinstance(controls, list)
    assert len(controls) > 0