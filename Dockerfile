# Sử dụng hình ảnh cơ sở chính thức của Python
FROM python:3.9-slim

# Cập nhật danh sách các gói và cài đặt một số công cụ cần thiết
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Tạo một thư mục làm việc
WORKDIR /app

# Cài đặt JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Mở cổng 8000
EXPOSE 8000

# Tạo thư mục cho Jupyter Notebook
RUN mkdir -p /root/.jupyter

# Thêm file cấu hình để JupyterLab chạy trên cổng 8000
RUN echo "c.NotebookApp.port = 8000" >> /root/.jupyter/jupyter_notebook_config.py

# Lệnh để chạy JupyterLab khi container khởi động
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
