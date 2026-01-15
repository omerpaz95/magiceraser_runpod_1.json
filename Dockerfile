# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.5 --mode remote
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.2.5
RUN comfy node install --exit-on-fail comfyui-logicutils@1.7.2
RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0

RUN git clone https://github.com/1038lab/ComfyUI-MiniMax-Remover /comfyui/custom_nodes/ComfyUI-MiniMax-Remover

RUN pip install -r /comfyui/custom_nodes/ComfyUI-MiniMax-Remover/requirements.txt
# download models into comfyui

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
