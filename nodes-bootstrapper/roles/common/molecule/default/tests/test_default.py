import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


@pytest.mark.parametrize('file', [
  "/usr/local/bin/cfssl",
  "/usr/local/bin/cfssljson",
  "/usr/local/bin/kubectl",
])
def test_executable_files(host, file):
    file = host.file(file)

    assert file.exists
    assert file.mode == 0o755


@pytest.mark.parametrize('file', [
  "/home/ubuntu/certificates/ca-config.json",
  "/home/ubuntu/certificates/ca-csr.json",
  "/home/ubuntu/certificates/admin-csr.json",
  "/home/ubuntu/certificates/worker-0-csr.json",
  "/home/ubuntu/certificates/worker-1-csr.json",
  "/home/ubuntu/certificates/worker-2-csr.json",
  "/home/ubuntu/certificates/kube-controller-manager-csr.json",
  "/home/ubuntu/certificates/kube-proxy-csr.json",
])
def test_certificates(host, file):
    file = host.file(file)

    assert file.exists
    assert file.mode == 0o644
