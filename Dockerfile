FROM python:3.9-slim-buster 

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt JupyterLab 
RUN pip install --upgrade pip
RUN pip install jupyterlab 

# Cài đặt thêm các thư viện cần thiết (nếu có)
RUN pip install <tên_thư_viện_1> <tên_thư_viện_2> ...

# Cấu hình Jupyter Lab (tuỳ chọn)
COPY jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

# Tạo thư mục làm việc 
WORKDIR /workspace

# Mở cổng cho JupyterLab
EXPOSE 8888

# Khởi chạy JupyterLab với token đã chỉ định
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=$PORT", "--no-browser", "--allow-root", "--NotebookApp.token=11042006"]
