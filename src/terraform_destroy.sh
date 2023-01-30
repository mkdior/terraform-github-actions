#!/bin/bash

function terraformDestroy {
  # Gather the output of `terraform destroy`.
  echo "destroy: info: destroying Terraform-managed infrastructure in ${tfWorkingDir}"
  destroyOutput=$(terraform destroy -auto-approve -input=false ${*} 2>&1)
  destroyExitCode=${?}
  destroyCommentStatus="Failed"

  # Exit code of 0 indicates success. Print the output and exit.
  if [ ${destroyExitCode} -eq 0 ]; then
    echo "destroy: info: successfully destroyed Terraform-managed infrastructure in ${tfWorkingDir}"
    echo "${destroyOutput}"
    echo
    destroyCommentStatus="Success"
  fi

  # Exit code of !0 indicates failure.
  if [ ${destroyExitCode} -ne 0 ]; then
    echo "destroy: error: failed to destroy Terraform configuration in ${tfWorkingDir}"
    echo "${destroyOutput}"
    echo
  fi

  exit ${destroyExitCode}
}
