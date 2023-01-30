#!/bin/bash

function terraformOutput {
  # Gather the output of `terraform output`.
  echo "output: info: gathering all the outputs for the Terraform configuration in ${tfWorkingDir}"
  outputOutput=$(terraform output -json ${*} 2>&1)
  outputExitCode=${?}

  # Exit code of !0 indicates failure.
  echo "output: error: failed to gather all the outputs for the Terraform configuration in ${tfWorkingDir}"
  echo "${outputOutput}"
  echo
  exit ${outputExitCode}
}
