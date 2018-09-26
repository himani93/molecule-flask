import os
import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('primary-controller')


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
  "/home/ubuntu/certificates/json/ca-config.json",
  "/home/ubuntu/certificates/json/ca-csr.json",
  "/home/ubuntu/certificates/json/admin-csr.json",
  "/home/ubuntu/certificates/json/worker-0-csr.json",
  "/home/ubuntu/certificates/json/worker-1-csr.json",
  "/home/ubuntu/certificates/json/worker-2-csr.json",
  "/home/ubuntu/certificates/json/kube-controller-manager-csr.json",
  "/home/ubuntu/certificates/json/kube-proxy-csr.json",
  "/home/ubuntu/certificates/json/kube-scheduler-csr.json",
  "/home/ubuntu/certificates/json/kubernetes-csr.json",
  "/home/ubuntu/certificates/json/service-account-csr.json",
])
def test_certificates(host, file):
    file = host.file(file)

    assert file.exists
    assert file.mode == 0o644
