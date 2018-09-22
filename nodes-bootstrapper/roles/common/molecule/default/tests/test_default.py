import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


@pytest.mark.parametrize('file', [
  "/usr/local/bin/cfssl",
  "/usr/local/bin/cfssljson"
])
def test_files(host, file):
    file = host.file(file)

    assert file.exists
    assert file.mode == 0o755
