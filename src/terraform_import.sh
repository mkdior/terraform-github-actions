#!/bin/bash

function terraformImport {
  # Gather the output of `terraform import`.
  echo "import: info: importing Terraform configuration in ${tfWorkingDir}"
  importOutput=$(terraform import -input=false ${*} 2>&1)
  importExitCode=${?}
  importCommentStatus="Failed"

  # Exit code of 0 indicates success with no changes. Print the output and exit.
  if [ ${importExitCode} -eq 0 ]; then
    echo "import: info: successfully imported Terraform configuration in ${tfWorkingDir}"
    echo "${importOutput}"
    echo
    exit ${importExitCode}
  fi

  # Exit code of !0 indicates failure.
  if [ ${importExitCode} -ne 0 ]; then
    echo "import: error: failed to import Terraform configuration in ${tfWorkingDir}"
    echo "${importOutput}"
    echo
  fi

  exit ${importExitCode}
}
