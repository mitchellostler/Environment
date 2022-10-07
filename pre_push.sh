./skyrun bin code_format --branch=origin/master
./skyrun bin lint_modified

ninja -j31 -k1 -C /home/skydio/aircam/build/build/bionic/x86_64-linux-gnu/RelWithDebInfo/aircam run_linter

./skybuild
./bazel buil

