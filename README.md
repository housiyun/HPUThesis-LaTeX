# 河南理工大学研究生学位论文 LaTeX 模板

以豫理工研〔2023〕24号《河南理工大学研究生学位论文撰写规范》及附件 1 为格式依据，参照 TongjiThesis_Proto 1.9.0 的文档类、封面信息与分章组织方式编写。学校题字图取自附件 1。正文为排版示例。

## 开始使用

1. 在 TeX Live 或 MacTeX 环境下解压并打开项目。使用 Overleaf 时，上传 ZIP，选择 XeLaTeX，并将主文件设为 thesis.tex。
2. 在 thesis.tex 首行的文档类设置中选择学位类型。在 chapters/info.tex 中填写实际题名、姓名、导师、学位类别、专业、日期和关键词等。
3. 在 chapters/abstract.tex 中写摘要，在 chapters/chap01.tex 等文件中写正文。增删章节时同步修改 thesis.tex。把图片放到 figures/，把 BibTeX 条目放到 ref/refs.bib。
4. 在 thesis.tex 所在目录运行下列命令。latexmk 会调用 XeLaTeX 和 Biber，并重复编译以更新目录、引用与总页数。

~~~sh
latexmk -xelatex thesis.tex
~~~

也可以依次运行 xelatex thesis、biber thesis、xelatex thesis、xelatex thesis；新增目录项后如有重编提示，再运行一次 xelatex thesis。

## 学位类型

| 论文类型 | degree | degreetype |
| --- | --- | --- |
| 硕士学术学位 | master | academic |
| 硕士专业学位 | master | profession |
| 同等学力申请硕士 | master | equaleducation |
| 博士学术学位 | doctor | academic |
| 博士专业学位 | doctor | profession |

类选项决定封面类别、偶数页页眉和数据集中的学位级别。chapters/info.tex 中的 degree-name（如工学硕士、电子信息硕士）、degree-field、专业、学制等信息按实际情况填写。硕士专业学位题名页显示第二导师行，按校内、企业（行业）的顺序填写两位导师及职称。

## 字体与版面

- fonts=portable 是默认选项，使用 TeX Live 提供的 Fandol 和 TeX Gyre Termes，可直接编译。封面学位类型行用楷体近似附件要求的隶书。
- fonts=system 使用系统安装的 SimSun（宋体）、SimHei（黑体）、KaiTi（楷体）、LiSu（隶书）和 Times New Roman。字体须能按这些名称被 XeLaTeX 找到。模板包未附带商业字体。该选项取决于用户环境中的字体安装情况。
- 正文用小四号字、固定 22 磅行距，A4 双面排版，内侧额外预留 1 cm 装订线。摘要从大写罗马数字 I 起算，正文从阿拉伯数字 1 起算。封面、声明页、题名页分别从 PDF 的第 1、3、5 页开始。右页起章所需的空白页自动插入，空白页不印页眉页码。
- 图、表和公式按章编号。正文的示例包含三线表、公式、交叉引用和 siunitx 计量单位写法。跨页表可用 longtable，用 endfirsthead/endhead 设置重复表头，并在续页右上方注明表序号和“（续表）”。
- 参考文献按校方所列 GB/T 7714—2015 顺序编码制排版。用 \cite{键} 生成上角编号。文献数量、语种和年份分布须按校方要求自行核对。
- 数据集使用附件 1 的字段与星号，论文总页数默认填入 PDF 的物理页数（含封面与空白页）。若学院另有计页口径，在 chapters/dataset.tex 中替换 \ztotpages。数据集表格保持单页，较长的字段请查看预览并调整换行。

## 送审、定稿与印刷

- 本项目默认启用 anonymous。送审版的封面和题名页在作者、导师及导师职称对应栏显示“送审时隐去”，清空 PDF 作者属性，使用未签字的声明，并省略致谢、作者简历和数据集。实名定稿时，从 thesis.tex 的类选项中删除 anonymous。这些省略项可按学院要求调整。正文、图表、自引以及其他手写内容中的身份信息须自行检查。
- 定稿时可把亲笔签名后的封二扫描为一页 A4 PDF，保存为 chapters/statements-signed.pdf。实名编译时会在原位置自动替换声明页。
- 博士封面按规范印在暗红色封面纸上，硕士封面用白色。纸质书脊由装订方按实际厚度制作。书脊用宋体，依次排论文题目、作者姓名和“河南理工大学”，两端分别留 3.5 cm。
- 豫理工研〔2023〕24号规定定稿电子版原则上用 Word 排版。提交前请按学院当年的通知确认是否接受 LaTeX 生成的 PDF，以及归档格式和匿名范围。

## 文件入口

| 文件 | 用途 |
| --- | --- |
| thesis.tex | 选择类型、组织章节、编译入口 |
| hputhesis.cls | 文档类，集中定义版式 |
| chapters/info.tex | 统一填写论文信息与关键词 |
| chapters/cover.tex、chapters/statements.tex、chapters/titlepage.tex | 封面、声明与题名页 |
| chapters/abstract.tex、chapters/denotation.tex | 中英文摘要与变量注释表 |
| chapters/chap01.tex 等 | 正文章节 |
| chapters/ack.tex、chapters/appendix.tex、chapters/resume.tex、chapters/dataset.tex | 致谢、附录、简历与数据集 |
| figures/、ref/refs.bib | 图片与参考文献 |

示例使用 TeX Live 2025 的 XeLaTeX 与 Biber 验证。
