# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-logicutils@1.7.2 --mode remote

RUN git clone https://github.com/1038lab/ComfyUI-MiniMax-Remover /comfyui/custom_nodes/ComfyUI-MiniMax-Remover

# download models into comfyui

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
