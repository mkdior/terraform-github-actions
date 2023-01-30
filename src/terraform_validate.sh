#!/bin/bash

function terraformValidate {
  # Gather the output of `terraform validate`.
  echo "validate: info: validating Terraform configuration in ${tfWorkingDir}"
  validateOutput=$(terraform validate ${*} 2>&1)
  validateExitCode=${?}

  # Exit code of 0 indicates success. Print the output and exit.
  if [ ${validateExitCode} -eq 0 ]; then
    echo "validate: info: successfully validated Terraform configuration in ${tfWorkingDir}"
    echo "${validateOutput}"
    echo
    exit ${validateExitCode}
  fi

  # Exit code of !0 indicates failure.
  echo "validate: error: failed to validate Terraform configuration in ${tfWorkingDir}"
  echo "${validateOutput}"
  echo

  exit ${validateExitCode}
}
