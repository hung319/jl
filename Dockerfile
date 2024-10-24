FROM python:latest

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt Jupyter Notebook và các thư viện
RUN pip install --upgrade pip && \
    pip install notebook numpy pandas scipy matplotlib scikit-learn

# Tạo thư mục làm việc cho Jupyter Notebook
WORKDIR /root

# Mở cổng 8888 cho Jupyter Notebook
EXPOSE 8888

# Khởi động Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token='11042006'"]
