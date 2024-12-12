FROM jupyter/base-notebook

RUN pip install pandas matplotlib
EXPOSE 8000

# Set the password hash here
ARG HASHED_PASSWORD="sha1:6e0e766116d0285a69a3f6ca9d88d3b5:50e4fe761df1673512cde01db4bb28a393063e41"

RUN echo "c.NotebookApp.password = '${HASHED_PASSWORD}'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8000", "--no-browser", "--allow-root"]
