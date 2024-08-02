# Sử dụng image Python chính thức làm nền tảng
FROM python:3.9-slim-buster

# Cài đặt các gói hệ thống cần thiết (ví dụ: hỗ trợ build các gói Python)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép file yêu cầu của dự án (nếu có) vào container
COPY requirements.txt .

# Cài đặt JupyterLab và các thư viện Python cần thiết
RUN pip install --no-cache-dir jupyterlab numpy pandas matplotlib

# Mở cổng 8888 để truy cập JupyterLab từ bên ngoài
EXPOSE 8888

# Câu lệnh chạy JupyterLab khi container được khởi động
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=0", "--allow-root"]

