"""Provides the repository macro to import LLVM."""

load("//third_party:repo.bzl", "tf_http_archive")

def repo(name):
    """Imports LLVM."""
    LLVM_COMMIT = "f89944530726f7b315b30670a7e1f93d0cd926f0"
    LLVM_SHA256 = "629e721bc946e05e9e04df0b413907e84cc52c8c4d5e66332a2bec06a3bbd404"

    tf_http_archive(
        name = name,
        sha256 = LLVM_SHA256,
        strip_prefix = "llvm-project-" + LLVM_COMMIT,
        urls = [
            "https://storage.googleapis.com/mirror.tensorflow.org/github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT),
            "https://github.com/llvm/llvm-project/archive/{commit}.tar.gz".format(commit = LLVM_COMMIT),
        ],
        link_files = {
            "//third_party/llvm:llvm.autogenerated.BUILD": "llvm/BUILD",
            "//third_party/mlir:BUILD": "mlir/BUILD",
            "//third_party/mlir:build_defs.bzl": "mlir/build_defs.bzl",
            "//third_party/mlir:linalggen.bzl": "mlir/linalggen.bzl",
            "//third_party/mlir:tblgen.bzl": "mlir/tblgen.bzl",
            "//third_party/mlir:test.BUILD": "mlir/test/BUILD",
        },
    )