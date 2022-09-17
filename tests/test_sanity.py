import brownie
import pytest

class TestSanity():
    def test_token_deploys(Testament, accounts):
        testament = accounts[0].deploy(Testament)
        assert testament.owner() == accounts[0].address