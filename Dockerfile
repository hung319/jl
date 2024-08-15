# Sử dụng hình ảnh cơ sở Ubuntu
FROM ubuntu:latest

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get upgrade -y && \
    pip3 install jupyterlab && \
    apt-get install sudo

# Tạo một thư mục làm thư mục làm việc và thiết lập môi trường cho Jupyter
WORKDIR /workspace
ENV PATH="/root/.local/bin:${PATH}"

# Mở cổng cho JupyterLab
EXPOSE 8888

# Chạy Jupyter
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=11042006"]
