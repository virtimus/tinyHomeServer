
<!--
#@bashMarkupScript:0.0.1
#@depends:bs
-->

Connect to ths (ssh ths -p 2022) & run setup script:
```
tsetup features/jupyter
```
Successful init should end with:

**\[tsetup\] END.**

Wait till Jupyter notebook is avalilable at http://ths:8888 

The authorisation token should be accessible using tjupyter-pass command:
```
tjupyter-pass
```

Allow inframe:

~/.jupyter/jupyter_notebook_config.py

c.NotebookApp.tornado_settings = {
    'headers': {
        'Content-Security-Policy': "frame-ancestors 'self' http://ths http://ths.lan"
  }
}

	




