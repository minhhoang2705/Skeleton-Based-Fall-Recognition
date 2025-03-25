FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04
WORKDIR /workspace
SHELL ["/bin/bash", "-c"]

# Install essential packages including cmake and gh
RUN apt-get update && apt-get install -y \
    git wget curl tmux openssh-client cmake gh

# Install Miniconda
RUN mkdir -p ~/miniconda3 && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && \
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
    rm ~/miniconda3/miniconda.sh

# Add conda to PATH and initialize
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN conda init bash && \
    echo "source ~/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN conda update -n base -c defaults conda
RUN conda install -y python=3.10.* pip

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip setuptools wheel

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Clone GitHub repo and adjust requirements
RUN mkdir -p ~/.ssh && \
    git clone https://github.com/JunkyByte/easy_ViTPose.git && \
    cd easy_ViTPose && \
    pip install -e . && \
    pip install certifi==2023.7.22 \
    charset-normalizer==3.2.0 \
    coloredlogs==15.0.1 \
    contourpy==1.1.1 \
    cycler==0.11.0 \
    ffmpeg==1.4 \
    filelock==3.12.4 \
    filterpy==1.4.5 \
    flatbuffers==23.5.26 \
    fonttools==4.43.0 \
    humanfriendly==10.0 \
    idna==3.4 \
    imageio==2.31.3 \
    importlib-resources==6.1.0 \
    jinja2>=3.1.3 \
    kiwisolver==1.4.5 \
    lazy_loader==0.3 \
    MarkupSafe==2.1.3 \
    matplotlib==3.8.0 \
    mpmath==1.3.0 \
    networkx==3.1 \
    numpy==1.26.0 \
    onnx==1.14.1 \
    onnxruntime==1.17.0 \
    opencv-python==4.8.0.76 \
    packaging==23.1 \
    pandas==2.1.1 \
    Pillow>=10.2.0 \
    protobuf==4.24.3 \
    psutil==5.9.5 \
    py-cpuinfo==9.0.0 \
    pycocotools==2.0.8 \
    pyparsing==3.1.1 \
    python-dateutil==2.8.2 \
    pytz==2023.3.post1 \
    PyWavelets==1.4.1 \
    PyYAML==6.0.1 \
    requests==2.31.0 \
    scikit-image==0.21.0 \
    scipy==1.11.2 \
    seaborn==0.12.2 \
    six==1.16.0 \
    sympy==1.12 \
    tifffile==2023.9.18 \
    tqdm==4.66.1 \
    typing_extensions==4.8.0 \
    tzdata==2023.3 \
    ultralytics==8.2.48 \
    urllib3>=2.0.7 \
    zipp==3.17.0 \
    onnxruntime-gpu>=1.13.0 \
    tensorrt>=8.5.1.7 \
    ipykernel

# Install PyTorch Nightly with CUDA 12.4 support
RUN pip install torch torchvision torchaudio
