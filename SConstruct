import os
import SCons

env = Environment(ENV=os.environ)
env['PDFLATEX'] = 'xelatex'
env['PDFLATEXFLAGS'] = SCons.Util.CLVar('-interaction=nonstopmode -shell-escape')
pdf = env.PDF('SAC_Docs.tex')
env.NoClean(pdf)
