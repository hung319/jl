FROM python:3.9-slim

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt JupyterLab
RUN pip install jupyterlab

# Tạo thư mục làm việc
WORKDIR /workspace

# Mở cổng cho JupyterLab
EXPOSE 8888

# Khởi chạy JupyterLab với token đã chỉ định
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=11042006"]
