# Inspired by https://blog.csdn.net/ancale/article/details/27982553
from zhon.hanzi import punctuation as CJK_PUNCTUATION
from docutils.nodes import *


def setup(app):
    app.connect('doctree-resolved', process_chinese_paragraph)


def cjkspacing(text):
    '''Fix spacing issue related to newlines of CJK characters.

    The idea is to split input text by newlines and then join them to a string.

    Some exceptions are:

    '''
    # split input text into lines
    lines = text.splitlines()
    # deal with exceptions
    for i in range(1, len(lines)):  # start from 1
        # current line starts with ASCII and last line starts with hanzi
        try:
            if ord(lines[i][0]) < 128 and lines[i-1][-1] not in CJK_PUNCTUATION:
                lines[i] = " " + lines[i]
        except:
            pass
    text = "".join(lines)
    return text


class ParagraphVisitor(NodeVisitor):
    def dispatch_visit(self, node):
        if isinstance(node, paragraph):
            for i in range(len(node.children)):
                if type(node[i]) == Text:
                    node[i] = Text(cjkspacing(node[i].astext()))


def process_chinese_paragraph(app, doctree, docname):
    pv = ParagraphVisitor(doctree)
    doctree.walk(pv)
