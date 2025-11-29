# Start from the Jupyter minimal-notebook image for this course
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy the explicit lock file into the image
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Update the default conda environment using the lock file
RUN mamba update --quiet --file /tmp/conda-linux-64.lock && \
    mamba clean --all -y -f && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
