.PHONY: create_env update_env run deploy

CONDA_ENV = snowflake_streamlit_env

create_env:
	conda env create -f environment.yml

update_env:
	conda env update -f environment.yml --prune

example:
	conda run -n $(CONDA_ENV) streamlit run src/app_example.py

dev:
	conda run -n $(CONDA_ENV) streamlit run src/streamlit_app.py

# Deploy only by GH
deploy:
	snow streamlit deploy --replace --debug

export_env:
	conda env export -n $(CONDA_ENV) > environment.yml

cleanpyfiles:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete
