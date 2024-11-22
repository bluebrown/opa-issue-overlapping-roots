# OPA Issue - Overlapping Roots

Start the registry, push the two bundles and then run opa.
This can be done with make, if preferred.

    make all

The output contains the following error:

    {"level":"error",
    "msg":"Bundle activation failed: detected overlapping roots in bundle manifest with: [one]",
    "name":"two","plugin":"bundle","time":"2024-11-22T11:11:33+01:00"}
