#!/usr/bin/env bash

set -e

echo "branch:  $TRAVIS_BRANCH"
echo "event:   $TRAVIS_EVENT_TYPE"
echo "module: esdl"

if [ "${TRAVIS_BRANCH}" = "master" ]; then
    if [ "${TRAVIS_EVENT_TYPE}" = "api" -o "${TRAVIS_EVENT_TYPE}" = "push" ]; then
        CONDA_PACKAGE=$(conda build --old-build-string -c conda-forge -c bc-dev -c ioos -c defaults recipes/esdl/ --output);
        for p in ${CONDA_PACKAGE}
        do
            echo "conda package ${p}";
            anaconda -v -t ${ANACONDA_TOKEN} upload "${p}" -u bc-dev --force;
         done
    else
        echo "NOT uploading to Anaconda Cloud, because this is the wrong event type";
        echo "event ${TRAVIS_EVENT_TYPE}"
    fi
else
    echo "NOT uploading to Anaconda Cloud, because this is the wrong branch";
    echo "branch ${TRAVIS_BRANCH}";
fi
