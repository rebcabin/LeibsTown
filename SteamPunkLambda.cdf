(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    811946,      19966]
NotebookOptionsPosition[    794661,      19383]
NotebookOutlinePosition[    795210,      19403]
CellTagsIndexPosition[    795167,      19400]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["\<\
Steam-Punk Lambda:
General Computation with 4x4 Matrices\
\>", "Title"],

Cell["\<\
Brian Beckman, Erik Meijer, David Leibs
Dec 2012
Brisbane, Australia\
\>", "Subtitle"],

Cell["\<\
Can we do arbitrary computations using only operations on 4x4 matrices? We'd \
like that since we might be able to run them on a GPU. The idea is to compile \
ordinary code to operations on 4x4 matrices, as if that were the instruction \
set of our machine. Contrast this against OpenACC or CUDA, which are \
basically DSLs for the GPU embedded in ordinary programming languages. Those \
give you ways to write \"machine-sympathetic code\" for the GPU in C or C++ \
or whatever.\
\>", "Text"],

Cell[CellGroupData[{

Cell["EVERYTHING IS A 4X4 MATRIX", "Section"],

Cell[CellGroupData[{

Cell["Symbolic matrices", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"script", "[", "c_", "]"}], ":=", 
  RowBox[{"Quiet", "@", 
   RowBox[{"ToExpression", "[", 
    RowBox[{"\"\<\\\\[Script\>\"", "<>", "\"\<Capital\>\"", "<>", 
     RowBox[{"ToUpperCase", "[", 
      RowBox[{"ToString", "[", "c", "]"}], "]"}], "<>", "\"\<]\>\""}], 
    "]"}]}]}]], "Input",
 InitializationCell->True],

Cell[BoxData[
 RowBox[{
  RowBox[{"double", "[", "c_", "]"}], ":=", 
  RowBox[{"Quiet", "@", 
   RowBox[{"ToExpression", "[", 
    RowBox[{"\"\<\\\\[DoubleStruck\>\"", "<>", "\"\<Capital\>\"", "<>", 
     RowBox[{"ToUpperCase", "[", 
      RowBox[{"ToString", "[", "c", "]"}], "]"}], "<>", "\"\<]\>\""}], 
    "]"}]}]}]], "Input",
 InitializationCell->True],

Cell[BoxData[
 RowBox[{
  RowBox[{"greek", "[", "c_", "]"}], ":=", 
  RowBox[{"Quiet", "@", 
   RowBox[{"ToExpression", "[", 
    RowBox[{
     RowBox[{"ToString", "[", "c", "]"}], "/.", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\"\<a\>\"", "\[Rule]", "\[Alpha]"}], ",", 
       RowBox[{"\"\<b\>\"", "\[Rule]", "\[Beta]"}], ",", 
       RowBox[{"\"\<c\>\"", "\[Rule]", "\[Gamma]"}], ",", 
       RowBox[{"\"\<d\>\"", "\[Rule]", "\[Delta]"}], ",", 
       RowBox[{"\"\<e\>\"", "\[Rule]", "\[Epsilon]"}], ",", 
       RowBox[{"\"\<f\>\"", "\[Rule]", "\[Phi]"}], ",", 
       RowBox[{"\"\<g\>\"", "\[Rule]", "\[Chi]"}], ",", 
       RowBox[{"\"\<h\>\"", "\[Rule]", "\[Eta]"}], ",", 
       RowBox[{"\"\<i\>\"", "\[Rule]", "\[Iota]"}], ",", 
       RowBox[{"\"\<j\>\"", "\[Rule]", "\[CurlyPhi]"}], ",", 
       RowBox[{"\"\<k\>\"", "\[Rule]", "\[Kappa]"}], ",", 
       RowBox[{"\"\<l\>\"", "\[Rule]", "\[Lambda]"}], ",", 
       RowBox[{"\"\<m\>\"", "\[Rule]", "\[Mu]"}], ",", 
       RowBox[{"\"\<n\>\"", "\[Rule]", "\[Nu]"}], ",", 
       RowBox[{"\"\<o\>\"", "\[Rule]", "\[Omicron]"}], ",", 
       RowBox[{"\"\<p\>\"", "\[Rule]", "\[Pi]"}], ",", 
       RowBox[{"\"\<q\>\"", "\[Rule]", "\[Theta]"}], ",", 
       RowBox[{"\"\<r\>\"", "\[Rule]", "\[Rho]"}], ",", 
       RowBox[{"\"\<s\>\"", "\[Rule]", "\[Sigma]"}], ",", 
       RowBox[{"\"\<t\>\"", "\[Rule]", "\[Tau]"}], ",", 
       RowBox[{"\"\<u\>\"", "\[Rule]", "\[Upsilon]"}], ",", 
       RowBox[{"\"\<w\>\"", "\[Rule]", "\[Omega]"}], ",", 
       RowBox[{"\"\<x\>\"", "\[Rule]", "\[Xi]"}], ",", 
       RowBox[{"\"\<y\>\"", "\[Rule]", "\[Psi]"}], ",", 
       RowBox[{"\"\<z\>\"", "\[Rule]", "\[Zeta]"}]}], "}"}]}], 
    "]"}]}]}]], "Input",
 InitializationCell->True],

Cell[BoxData[
 RowBox[{
  RowBox[{"pv", "[", 
   RowBox[{"ul_", ",", "ur_", ",", "ll_", ",", "lr_"}], "]"}], ":=", 
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"ul", "ur", 
      RowBox[{"greek", "@", "ul"}], 
      RowBox[{"greek", "@", "ur"}]},
     {"ll", "lr", 
      RowBox[{"greek", "@", "ll"}], 
      RowBox[{"greek", "@", "lr"}]},
     {
      RowBox[{"script", "@", "ul"}], 
      RowBox[{"script", "@", "ur"}], 
      RowBox[{"double", "@", "ul"}], 
      RowBox[{"double", "@", "ur"}]},
     {
      RowBox[{"script", "@", "ll"}], 
      RowBox[{"script", "@", "lr"}], 
      RowBox[{"double", "@", "ll"}], 
      RowBox[{"double", "@", "lr"}]}
    }], "\[NoBreak]", ")"}]}]], "Input",
 InitializationCell->True]
}, Closed]],

Cell[CellGroupData[{

Cell["\<\
Standard display ideas from the \"Insert\" menu\
\>", "Subsection"],

Cell["\<\
Consider arbitrary 4x4 matrices, broken into four 2x2 blocks. \
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "@", 
  RowBox[{"{", 
   RowBox[{"MatrixForm", "/@", "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"p", "=", 
       RowBox[{"pv", "[", 
        RowBox[{"a", ",", "b", ",", "c", ",", "d"}], "]"}]}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"q", "=", 
       RowBox[{"pv", "[", 
        RowBox[{"x", ",", "y", ",", "z", ",", "w"}], "]"}]}]}], "}"}]}], 
   "}"}]}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"x", "y", "\[Xi]", "\[Psi]"},
         {"z", "w", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["\<\
New display ideas from the @SE chat room\
\>", "Subsection"],

Cell[TextData[{
 "Thanks to Rojo @",
 StyleBox["Mathematica",
  FontSlant->"Italic"],
 ".stackexchange.com for this idea... something to develop"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{"p", ",", 
   RowBox[{"Dividers", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"{", 
        RowBox[{"True", ",", "False"}], "}"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"{", 
        RowBox[{"True", ",", "False"}], "}"}], "}"}]}], "}"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"a", "b", "\[Alpha]", "\[Beta]"},
    {"c", "d", "\[Gamma]", "\[Delta]"},
    {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]", 
     "\[DoubleStruckCapitalB]"},
    {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]", 
     "\[DoubleStruckCapitalD]"}
   },
   AutoDelete->False,
   GridBoxDividers->{"Columns" -> {{True, False}}, "Rows" -> {{True, False}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell["\<\
Thanks to rm-rf @Mathematica.stackexchange.com for this\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{"MatrixForm", "/@", 
       RowBox[{"Transpose", "@", 
        RowBox[{"Partition", "[", 
         RowBox[{"#", ",", "2"}], "]"}]}]}], ")"}], "&"}], "/@", 
    RowBox[{"Fold", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"Partition", "[", 
        RowBox[{"#1", ",", "#2"}], "]"}], "&"}], ",", 
      RowBox[{"Flatten", "@", "p"}], ",", 
      RowBox[{"{", 
       RowBox[{"2", ",", "4"}], "}"}]}], "]"}]}], ",", 
   RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b"},
         {"c", "d"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[Alpha]", "\[Beta]"},
         {"\[Gamma]", "\[Delta]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell["\<\
Thanks to rojo @Mathematica.stackexchange.com\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{
   RowBox[{"Map", "[", 
    RowBox[{"MatrixForm", ",", 
     RowBox[{"Partition", "[", 
      RowBox[{"p", ",", 
       RowBox[{"{", 
        RowBox[{"2", ",", "2"}], "}"}]}], "]"}], ",", 
     RowBox[{"{", "2", "}"}]}], "]"}], ",", 
   RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b"},
         {"c", "d"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[Alpha]", "\[Beta]"},
         {"\[Gamma]", "\[Delta]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["The upper-left corner is special", "Subsection"],

Cell["Divide matrices into equivalence classes:", "Text"],

Cell["\<\
All matrices with the same upper-left 2x2 block are equivalent -- they all \
represent the same value in the system. The contents of the other three \
blocks are \"machine-state,\" but the value of the matrix as a whole is just \
the value of the 2x2 block in the upper-left corner. \
\>", "Text"],

Cell[TextData[{
 "The prime representative of an equivalence class is the ",
 StyleBox["[CHIEF]",
  FontWeight->"Bold"],
 " of that class. It has the same upper-left 2x2 as every other member of the \
class, but zeros elsewhere. To test whether two matrices are equivalent, \
compare them both to their chiefs."
}], "Text"],

Cell[TextData[{
 "The ",
 StyleBox["[MACHINE-STATE]",
  FontWeight->"Bold"],
 " of a matrix is the contents of all the blocks other than the upper-left \
2x2 block."
}], "Text"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["PRIMITIVE MATRICES", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ill", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"},
      {"1", "0", "0", "0"},
      {"0", "1", "0", "0"}
     }], "\[NoBreak]", ")"}]}], ";", 
  RowBox[{"iul", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"1", "0", "0", "0"},
      {"0", "1", "0", "0"},
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"}
     }], "\[NoBreak]", ")"}]}], ";", 
  RowBox[{"iur", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"0", "0", "1", "0"},
      {"0", "0", "0", "1"},
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"}
     }], "\[NoBreak]", ")"}]}], ";", 
  RowBox[{"ilr", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"},
      {"0", "0", "1", "0"},
      {"0", "0", "0", "1"}
     }], "\[NoBreak]", ")"}]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"inf", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"Infinity", "0", "0", "0"},
      {"0", "Infinity", "0", "0"},
      {"0", "0", "Infinity", "0"},
      {"0", "0", "0", "Infinity"}
     }], "\[NoBreak]", ")"}]}], ";"}]], "Input"],

Cell["Convenience:", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"T", ",", "M"}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"T", "=", "Transpose"}], ";", 
  RowBox[{"M", "=", "MatrixForm"}], ";"}]}], "Input"],

Cell[TextData[{
 "Investigate what any particular operator does to a sample matrix in various \
combinations, namely ",
 Cell[BoxData[
  FormBox[
   RowBox[{"m", ".", "p", ".", 
    SuperscriptBox["m", "T"]}], TraditionalForm]]],
 ", ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SuperscriptBox["m", "T"], ".", "p", ".", "m"}], TraditionalForm]]],
 ", and so on:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"combos", "[", 
    RowBox[{"m_", ",", "p_"}], "]"}], ":=", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"mT", "=", 
       RowBox[{"m", "//", "T"}]}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"Grid", "[", 
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"M", "/@", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"m", ".", "p"}], ",", 
           RowBox[{"p", ".", "mT"}], ",", 
           RowBox[{"m", ".", "p", ".", "mT"}]}], "}"}]}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"M", "/@", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"mT", ".", "p"}], ",", 
           RowBox[{"p", ".", "m"}], ",", 
           RowBox[{"mT", ".", "p", ".", "m"}]}], "}"}]}]}], 
       "\[IndentingNewLine]", "}"}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"combos", "[", 
  RowBox[{"ill", ",", "p"}], "]"}]}], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"},
         {"0", "0", "\[ScriptCapitalA]", "\[ScriptCapitalB]"},
         {"0", "0", "\[ScriptCapitalC]", "\[ScriptCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[Alpha]", "\[Beta]", "0", "0"},
         {"\[Gamma]", "\[Delta]", "0", "0"},
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"combos", "[", 
  RowBox[{"iul", ",", "p"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "0", "0"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "0", "0"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["REGISTERS", "Section"],

Cell["\<\
Think of a 4x4 matrix as a machine with four registers: ul, ur, ll, lr, for \
\"upper-left,\" \"upper-right,\" \"lower-left,\" and \"lower-right.\"\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"registers", "=", 
   RowBox[{"{", 
    RowBox[{"iul", ",", "iur", ",", "ill", ",", "ilr"}], "}"}]}], 
  ";"}]], "Input"],

Cell["\<\
ul is like EAX in the x86 machine: it's a special register where you can find \
the result of a computation and where you expect the value of an actual \
argument to a unary function to appear.\
\>", "Text"]
}, Closed]],

Cell[CellGroupData[{

Cell["INSTRUCTIONS", "Section"],

Cell[CellGroupData[{

Cell["The MV Instruction", "Subsection"],

Cell["\<\
I can move the CHIEF in the upper left corner into any one of the four \
registers.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"MV", "[", 
   RowBox[{"reg_", ",", "m_"}], "]"}], ":=", 
  RowBox[{"reg", "/.", 
   RowBox[{"{", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"iul", "\[Rule]", 
      RowBox[{"iul", ".", "m", ".", 
       RowBox[{"(", 
        RowBox[{"iul", "//", "T"}], ")"}]}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"iur", "\[Rule]", 
      RowBox[{"iul", ".", "m", ".", 
       RowBox[{"(", 
        RowBox[{"ill", "//", "T"}], ")"}]}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"ill", "\[Rule]", 
      RowBox[{"ill", ".", "m", ".", 
       RowBox[{"(", 
        RowBox[{"iul", "//", "T"}], ")"}]}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"ilr", "\[Rule]", 
      RowBox[{"ill", ".", "m", ".", 
       RowBox[{"(", 
        RowBox[{"ill", "//", "T"}], ")"}]}]}]}], "\[IndentingNewLine]", 
    "}"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"MV", "[", 
        RowBox[{"#", ",", "p"}], "]"}], "//", "M"}], ")"}], "&"}], "/@", 
    "registers"}], "}"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[TextData[{
 "MV is ",
 StyleBox["hippocratic",
  FontWeight->"Bold",
  FontSlant->"Italic"],
 ": If its first argument is not a register, MV produces its first argument."
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"MV", "[", 
   RowBox[{"p", ",", "q"}], "]"}], "//", "M"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"a", "b", "\[Alpha]", "\[Beta]"},
     {"c", "d", "\[Gamma]", "\[Delta]"},
     {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]", 
      "\[DoubleStruckCapitalB]"},
     {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]", 
      "\[DoubleStruckCapitalD]"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["The AMV Instruction", "Subsection"],

Cell["\<\
Move any one of the four registers into ul, the CHIEF position. These \
operations are all conjugates of the corresponding MV instructions. \
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"AMV", "[", 
   RowBox[{"reg_", ",", "m_"}], "]"}], ":=", 
  RowBox[{"reg", "/.", 
   RowBox[{"{", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"iul", "\[Rule]", 
      RowBox[{"iul", ".", "m", ".", 
       RowBox[{"(", 
        RowBox[{"iul", "//", "T"}], ")"}]}]}], ",", "\[IndentingNewLine]", 
     RowBox[{"iur", "\[Rule]", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"iul", "//", "T"}], ")"}], ".", "m", ".", "ill"}]}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"ill", "\[Rule]", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"ill", "//", "T"}], ")"}], ".", "m", ".", "iul"}]}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"ilr", "\[Rule]", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"ill", "//", "T"}], ")"}], ".", "m", ".", "ill"}]}]}], 
    "\[IndentingNewLine]", "}"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"AMV", "[", 
        RowBox[{"#", ",", "p"}], "]"}], "//", "M"}], ")"}], "&"}], "/@", 
    "registers"}], "}"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[Alpha]", "\[Beta]", "0", "0"},
         {"\[Gamma]", "\[Delta]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "0", "0"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["The CHF Instruction", "Subsection"],

Cell["\<\
Extract the CHIEF of any matrix by masking off the MACHINE-STATE portion\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"CHF", "[", "m_", "]"}], ":=", 
   RowBox[{"iul", ".", "m", ".", 
    RowBox[{"(", 
     RowBox[{"iul", "//", "T"}], ")"}]}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"CHF", "[", "p", "]"}], "//", "M"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"a", "b", "0", "0"},
     {"c", "d", "0", "0"},
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["The ST Instruction", "Subsection"],

Cell["\<\
Extract the MACHINE-STATE from any matrix -- the ANTI-CHIEF as it were.\
\>", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ST", "[", "m_", "]"}], ":=", 
  RowBox[{"m", "-", 
   RowBox[{"CHF", "[", "m", "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"ST", "[", "p", "]"}], "//", "M"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "\[Alpha]", "\[Beta]"},
     {"0", "0", "\[Gamma]", "\[Delta]"},
     {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]", 
      "\[DoubleStruckCapitalB]"},
     {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]", 
      "\[DoubleStruckCapitalD]"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{"{", 
   RowBox[{"M", "/@", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ap", "=", 
       RowBox[{"ST", "[", "p", "]"}]}], ",", 
      RowBox[{"aq", "=", 
       RowBox[{"ST", "[", "q", "]"}]}]}], "}"}]}], "}"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "\[Alpha]", "\[Beta]"},
         {"0", "0", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "\[Xi]", "\[Psi]"},
         {"0", "0", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["The CY instruction", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"CY", "[", 
   RowBox[{"r1_", ",", "r2_", ",", "m_"}], "]"}], ":=", 
  RowBox[{"MV", "[", 
   RowBox[{"r2", ",", 
    RowBox[{"AMV", "[", 
     RowBox[{"r1", ",", "m"}], "]"}]}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "@", 
  RowBox[{"{", 
   RowBox[{"M", "/@", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"CY", "[", 
       RowBox[{"iul", ",", "ilr", ",", "p"}], "]"}], ",", 
      RowBox[{"CY", "[", 
       RowBox[{"ilr", ",", "iul", ",", "p"}], "]"}]}], "}"}]}], 
   "}"}]}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "@", 
  RowBox[{"(", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"M", "@", 
       RowBox[{"CY", "[", 
        RowBox[{"#1", ",", "#2", ",", "p"}], "]"}]}], "&"}], ",", "registers",
      ",", "registers", ",", "1"}], "]"}], ")"}]}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"a", "b", "0", "0"},
         {"c", "d", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "a", "b"},
         {"0", "0", "c", "d"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[Alpha]", "\[Beta]", "0", "0"},
         {"\[Gamma]", "\[Delta]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "\[Alpha]", "\[Beta]"},
         {"0", "0", "\[Gamma]", "\[Delta]"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"\[Alpha]", "\[Beta]", "0", "0"},
         {"\[Gamma]", "\[Delta]", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "\[Alpha]", "\[Beta]"},
         {"0", "0", "\[Gamma]", "\[Delta]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "0", "0"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "\[ScriptCapitalA]", "\[ScriptCapitalB]"},
         {"0", "0", "\[ScriptCapitalC]", "\[ScriptCapitalD]"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "0", "0"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "\[ScriptCapitalA]", "\[ScriptCapitalB]"},
         {"0", "0", "\[ScriptCapitalC]", "\[ScriptCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
         {"0", "0", "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
         {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
         {"0", "0", "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Booleans", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"falseMatrix", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"}
     }], "\[NoBreak]", ")"}]}], ";", 
  RowBox[{"trueMatrix", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"1", "0", "0", "0"},
      {"0", "1", "0", "0"},
      {"0", "0", "1", "0"},
      {"0", "0", "0", "1"}
     }], "\[NoBreak]", ")"}]}], ";"}]], "Input"],

Cell["trueMatrix composed with any matrix is that matrix", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"trueMatrix", ".", "p"}], "===", "p"}]], "Input"],

Cell[BoxData["True"], "Output"]
}, Open  ]],

Cell["falseMatrix annihilates any matrix", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"falseMatrix", ".", "p"}], "===", "falseMatrix"}]], "Input"],

Cell[BoxData["True"], "Output"]
}, Open  ]],

Cell["A falsey matrix is one whose CHIEF matches the false matrix", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"falsey", "[", "m_", "]"}], ":=", 
  RowBox[{
   RowBox[{"CHF", "[", "m", "]"}], "===", "falseMatrix"}]}]], "Input"],

Cell["A truthy matrix is one whose CHIEF is not falsey", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"truthy", "[", "m_", "]"}], ":=", 
  RowBox[{
   RowBox[{"CHF", "[", "m", "]"}], "=!=", "falseMatrix"}]}]], "Input"],

Cell["\<\
The other registers don't matter when testing truthiness or falseyness\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"(", 
    RowBox[{"truthy", "[", 
     RowBox[{"MV", "[", 
      RowBox[{"#", ",", "p"}], "]"}], "]"}], ")"}], "&"}], "/@", 
  "registers"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"True", ",", "False", ",", "False", ",", "False"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"(", 
    RowBox[{"falsey", "[", 
     RowBox[{"MV", "[", 
      RowBox[{"#", ",", "p"}], "]"}], "]"}], ")"}], "&"}], "/@", 
  "registers"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"False", ",", "True", ",", "True", ",", "True"}], "}"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["GENETIC SEARCH FOR NAND", "Section"],

Cell["\<\
First, write a postfix calculator for instructions so that we can construct \
strings of instructions. Then, treat those strings as genomes and genetically \
search for the fomulas we need (David says: maybe we can use probabilistic \
fitness functions)\
\>", "Text"],

Cell[CellGroupData[{

Cell["Stack", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"ClearAll", "[", 
    RowBox[{
    "pushR", ",", "popR", ",", "dupR", ",", "rotR", ",", "swapR", ",", "topR",
      ",", "nextR", ",", "thirdR"}], "]"}], ";"}], "\n", 
  RowBox[{"(*", " ", 
   RowBox[{"stack", "-", "to", "-", 
    RowBox[{"stack", " ", "transforms"}]}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"pushR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", "stack___", "}"}], ",", "datum_"}], "}"}], 
     "\[RuleDelayed]", 
     RowBox[{"{", 
      RowBox[{"datum", ",", "stack"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"popR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"top_", ",", "rest___"}], "}"}], "\[RuleDelayed]", 
     RowBox[{"{", "rest", "}"}]}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"dupR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"top_", ",", "rest___"}], "}"}], "\[RuleDelayed]", 
     RowBox[{"{", 
      RowBox[{"top", ",", "top", ",", "rest"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"rotR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"top_", ",", "rest___"}], "}"}], "\[RuleDelayed]", 
     RowBox[{"{", 
      RowBox[{"rest", ",", "top"}], "}"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"swapR", "=", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"top_", ",", "next_", ",", "rest___"}], "}"}], 
      "\[RuleDelayed]", 
      RowBox[{"{", 
       RowBox[{"next", ",", "top", ",", "rest"}], "}"}]}], "}"}]}], ";"}], 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{"stack", "-", "to", "-", 
    RowBox[{"value", " ", "transforms"}]}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"topR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"{", 
       RowBox[{"top_", ",", "___"}], "}"}], "\[RuleDelayed]", "top"}], ",", 
     RowBox[{
      RowBox[{"{", "}"}], "\[RuleDelayed]", "falseMatrix"}]}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"nextR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"{", 
       RowBox[{"top_", ",", "next_", ",", "___"}], "}"}], "\[RuleDelayed]", 
      "next"}], ",", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"{", "_", "}"}], "|", 
        RowBox[{"{", "}"}]}], ")"}], "\[RuleDelayed]", "falseMatrix"}]}], 
    "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"thirdR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"{", 
       RowBox[{"top_", ",", "next_", ",", "third_", ",", "___"}], "}"}], 
      "\[RuleDelayed]", "third"}], ",", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"{", "_", "}"}], "|", 
        RowBox[{"{", 
         RowBox[{"a_", ",", "b_"}], "}"}], "|", 
        RowBox[{"{", "}"}]}], ")"}], "\[RuleDelayed]", "falseMatrix"}]}], 
    "}"}]}], ";"}]}], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Exec", "Subsection"],

Cell["\<\
MV, AMV, and CY are unsuitable for machine instructions because they have an \
implicit if-test in them. We need to construct if-tests from more primitive \
operations: plus, dot, minus, inverse, conjugation, determinant, trace, \
transpose, commutator, etc.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "instructionSet", "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"instructionSet", "=", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{"(*", 
     RowBox[{"MV", ",", "AMV", ",", "CY", ","}], "*)"}], 
    RowBox[{
    "nop", ",", "conj2", ",", "conj2I", ",", "plus", ",", "dot", ",", "minus",
      ",", "div", ",", "conj", ",", "conjI", ",", "comm", ",", "commI", ",", 
     "uminus", ",", "inv", ",", "det", ",", "tr", ",", "\[IndentingNewLine]", 
     "T", ",", "CHF", ",", "ST", ",", "\[IndentingNewLine]", "dup", ",", 
     "swap", ",", "rot", ",", "pop", ",", 
     RowBox[{"(*", 
      RowBox[{"nop", ","}], "*)"}], "true", ",", "false", ",", "ul", ",", 
     "ur", ",", "ll", ",", "lr"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{
   "exec", ",", "execTrace", ",", "execAllRaw", ",", "execAll", ",", 
    "execAllTrace", ",", "gridStack", ",", "microcode", ",", "myInv"}], "]"}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "/@", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{"(*", 
     RowBox[{"MV", ",", "AMV", ",", "CY", ","}], "*)"}], 
    RowBox[{
    "nop", ",", "conj2", ",", "conj2I", ",", "plus", ",", "dot", ",", "minus",
      ",", "div", ",", "conj", ",", "conjI", ",", "comm", ",", "commI", ",", 
     "inv", ",", "uminus", ",", "det", ",", "tr", ",", "\[IndentingNewLine]", 
     RowBox[{"(*", 
      RowBox[{"T", ",", "CHF", ",", "ST", ","}], "*)"}], 
     "\[IndentingNewLine]", "dup", ",", "swap", ",", "rot", ",", "pop", ",", 
     RowBox[{"(*", 
      RowBox[{"nop", ","}], "*)"}], "true", ",", "false", ",", "ul", ",", 
     "ur", ",", "ll", ",", "lr"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"myInv", "[", "m_", "]"}], ":=", 
   RowBox[{"Quiet", "@", 
    RowBox[{"Check", "[", 
     RowBox[{
      RowBox[{"Inverse", "[", "m", "]"}], ",", "inf"}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"microcode", "=", 
   RowBox[{"Dispatch", "@", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{
       RowBox[{"NOP", " ", "--"}], " ", "for", " ", "padding", " ", 
       "instruction", " ", "strings"}], " ", "*)"}], "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "nop"}], "}"}], "\[RuleDelayed]", "stack"}], 
      ",", "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "TERNARY", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "conj2"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"nT", "=", 
            RowBox[{"T", "@", 
             RowBox[{"(", 
              RowBox[{"stack", "/.", "topR"}], ")"}]}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"p", "=", 
            RowBox[{"stack", "/.", "nextR"}]}], ",", "\[IndentingNewLine]", 
           RowBox[{"m", "=", 
            RowBox[{"stack", "/.", "thirdR"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{
              RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], "/.", "popR"}],
             ",", 
            RowBox[{"m", ".", "p", ".", "nT"}]}], "}"}], "/.", "pushR"}]}], 
        "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "conj2I"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"nI", "=", 
            RowBox[{"myInv", "@", 
             RowBox[{"(", 
              RowBox[{"stack", "/.", "topR"}], ")"}]}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"p", "=", 
            RowBox[{"stack", "/.", "nextR"}]}], ",", "\[IndentingNewLine]", 
           RowBox[{"m", "=", 
            RowBox[{"stack", "/.", "thirdR"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{
              RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], "/.", "popR"}],
             ",", 
            RowBox[{"m", ".", "p", ".", "nI"}]}], "}"}], "/.", "pushR"}]}], 
        "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"(*", 
       RowBox[{"CY", ",", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{"CY", "[", 
             RowBox[{"third", ",", "next", ",", "top"}], "]"}]}], "}"}], ",", 
          RowBox[{
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"push", "[", "r", "]"}]}]}], "]"}], ","}], "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "BINARIES", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{"(*", 
       RowBox[{"MV", ",", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{"MV", "[", 
             RowBox[{"next", ",", "top"}], "]"}]}], "}"}], ",", 
          RowBox[{
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"push", "[", "r", "]"}]}]}], "]"}], ","}], "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{"(*", 
       RowBox[{"AMV", ",", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{"AMV", "[", 
             RowBox[{"next", ",", "top"}], "]"}]}], "}"}], ",", 
          RowBox[{
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"pop", "[", "]"}], ";", 
           RowBox[{"push", "[", "r", "]"}]}]}], "]"}], ","}], "*)"}], 
      "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "plus"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"stack", "/.", "nextR"}], ")"}], "+", 
            RowBox[{"(", 
             RowBox[{"stack", "/.", "topR"}], ")"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", "r"}], 
           "}"}], "/.", "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "dot"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"stack", "/.", "nextR"}], ")"}], ".", 
            RowBox[{"(", 
             RowBox[{"stack", "/.", "topR"}], ")"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", "r"}], 
           "}"}], "/.", "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "minus"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"stack", "/.", "nextR"}], ")"}], "-", 
            RowBox[{"(", 
             RowBox[{"stack", "/.", "topR"}], ")"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", "r"}], 
           "}"}], "/.", "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "div"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"stack", "/.", "nextR"}], ")"}], ".", 
            RowBox[{"myInv", "[", 
             RowBox[{"stack", "/.", "topR"}], "]"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", "r"}], 
           "}"}], "/.", "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "conj"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"m", "=", 
            RowBox[{"stack", "/.", "nextR"}]}], ",", 
           RowBox[{"p", "=", 
            RowBox[{"stack", "/.", "topR"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", 
            RowBox[{"m", ".", "p", ".", 
             RowBox[{"(", 
              RowBox[{"T", "@", "m"}], ")"}]}]}], "}"}], "/.", "pushR"}]}], 
        "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "conjI"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"m", "=", 
            RowBox[{"stack", "/.", "nextR"}]}], ",", 
           RowBox[{"p", "=", 
            RowBox[{"stack", "/.", "topR"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", 
            RowBox[{"m", ".", "p", ".", 
             RowBox[{"(", 
              RowBox[{"myInv", "@", "m"}], ")"}]}]}], "}"}], "/.", 
          "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "comm"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"m", "=", 
            RowBox[{"stack", "/.", "nextR"}]}], ",", 
           RowBox[{"p", "=", 
            RowBox[{"stack", "/.", "topR"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", 
            RowBox[{"m", ".", "p", ".", 
             RowBox[{"(", 
              RowBox[{"T", "@", "m"}], ")"}], ".", 
             RowBox[{"(", 
              RowBox[{"T", "@", "p"}], ")"}]}]}], "}"}], "/.", "pushR"}]}], 
        "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "commI"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"m", "=", 
            RowBox[{"stack", "/.", "nextR"}]}], ",", 
           RowBox[{"p", "=", 
            RowBox[{"stack", "/.", "topR"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", 
            RowBox[{"m", ".", "p", ".", 
             RowBox[{"(", 
              RowBox[{"myInv", "@", "m"}], ")"}], ".", 
             RowBox[{"(", 
              RowBox[{"myInv", "@", "p"}], ")"}]}]}], "}"}], "/.", 
          "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "UNARIES", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "uminus"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"stack", "/.", "popR"}], ",", 
           RowBox[{"(", 
            RowBox[{"-", 
             RowBox[{"trueMatrix", ".", 
              RowBox[{"(", 
               RowBox[{"stack", "/.", "topR"}], ")"}]}]}], ")"}]}], "}"}], "/.",
          "pushR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "inv"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"stack", "/.", "popR"}], ",", 
           RowBox[{"myInv", "@", 
            RowBox[{"(", 
             RowBox[{"stack", "/.", "topR"}], ")"}]}]}], "}"}], "/.", 
         "pushR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "det"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"stack", "/.", "popR"}], ",", 
           RowBox[{"trueMatrix", "*", 
            RowBox[{"Det", "[", 
             RowBox[{"stack", "/.", "topR"}], "]"}]}]}], "}"}], "/.", 
         "pushR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "tr"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{"stack", "/.", "topR"}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"stack", "/.", "popR"}], ",", 
            RowBox[{"trueMatrix", "*", 
             RowBox[{"Plus", "@@", 
              RowBox[{"Table", "[", 
               RowBox[{
                RowBox[{"r", "\[LeftDoubleBracket]", 
                 RowBox[{"i", ",", "i"}], "\[RightDoubleBracket]"}], ",", 
                RowBox[{"{", 
                 RowBox[{"i", ",", "4"}], "}"}]}], "]"}]}]}]}], "}"}], "/.", 
          "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "T"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"stack", "/.", "popR"}], ",", 
           RowBox[{"T", "@", 
            RowBox[{"(", 
             RowBox[{"stack", "/.", "topR"}], ")"}]}]}], "}"}], "/.", 
         "pushR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "CHF"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"stack", "/.", "popR"}], ",", 
           RowBox[{"CHF", "[", 
            RowBox[{"stack", "/.", "topR"}], "]"}]}], "}"}], "/.", "pushR"}], 
        ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "ST"}], "}"}], "\[RuleDelayed]", 
       "\[IndentingNewLine]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"stack", "/.", "popR"}], ",", 
           RowBox[{"r", "=", 
            RowBox[{"ST", "[", 
             RowBox[{"stack", "/.", "topR"}], "]"}]}]}], "}"}], "/.", 
         "pushR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "NULLARIES", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "dup"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "dupR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "swap"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "swapR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "rot"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "rotR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "pop"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "popR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"(*", 
       RowBox[{"nop", ",", "0", ","}], "*)"}], "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "CONSTANTS", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "true"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "trueMatrix"}], "}"}], "/.", "pushR"}], 
        ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "false"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "falseMatrix"}], "}"}], "/.", "pushR"}], 
        ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "ul"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "iul"}], "}"}], "/.", "pushR"}], ")"}]}], ",",
       "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "ur"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "iur"}], "}"}], "/.", "pushR"}], ")"}]}], ",",
       "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "ll"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "ill"}], "}"}], "/.", "pushR"}], ")"}]}], ",",
       "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "lr"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "ilr"}], "}"}], "/.", "pushR"}], ")"}]}], ",",
       "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "DEFAULT", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "x_"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"stack", ",", "x"}], "}"}], "/.", "pushR"}], ")"}]}]}], 
     "\[IndentingNewLine]", "}"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exec", "[", 
    RowBox[{"stack_", ",", "instr_"}], "]"}], ":=", 
   RowBox[{"Chop", "@", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"stack", ",", "instr"}], "}"}], "/.", "microcode"}], ")"}]}]}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exec", "[", "___", "]"}], ":=", 
   RowBox[{"Throw", "[", 
    RowBox[{"\"\<bad exec: \>\"", "<>", 
     RowBox[{"ToString", "@", 
      RowBox[{"{", "___", "}"}]}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execTrace", "[", 
    RowBox[{"stack_", ",", "instr_"}], "]"}], ":=", 
   RowBox[{"gridStack", "@", 
    RowBox[{"Reverse", "@", 
     RowBox[{"exec", "[", 
      RowBox[{"stack", ",", "instr"}], "]"}]}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execAllRaw", "[", 
    RowBox[{"stack_", ",", "instrs_"}], "]"}], ":=", 
   RowBox[{"Fold", "[", 
    RowBox[{"exec", ",", "stack", ",", "instrs"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execAll", "[", 
    RowBox[{"stack_", ",", "instrs_"}], "]"}], ":=", 
   RowBox[{"gridStack", "@", 
    RowBox[{"execAllRaw", "[", 
     RowBox[{"stack", ",", "instrs"}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execAllTrace", "[", 
    RowBox[{"stack_", ",", "instrs_"}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"history", "=", 
       RowBox[{
        RowBox[{
         RowBox[{"Grid", "[", 
          RowBox[{
           RowBox[{"{", "#", "}"}], ",", 
           RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}], "&"}], "/@", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"(", 
            RowBox[{"M", "/@", "#"}], ")"}], "&"}], "/@", 
          RowBox[{"Reverse", "/@", 
           RowBox[{"FoldList", "[", 
            RowBox[{"exec", ",", "stack", ",", "instrs"}], "]"}]}]}], 
         ")"}]}]}], "}"}], ",", 
     RowBox[{"Grid", "[", 
      RowBox[{
       RowBox[{"Partition", "[", 
        RowBox[{
         RowBox[{"Join", "[", 
          RowBox[{
           RowBox[{"{", "start", "}"}], ",", 
           RowBox[{"Riffle", "[", 
            RowBox[{"history", ",", 
             RowBox[{"M", "/@", "instrs"}]}], "]"}]}], "]"}], ",", "2"}], 
        "]"}], ",", 
       RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]}], "]"}]}], ";", 
  RowBox[{
   RowBox[{"gridStack", "[", "stack_", "]"}], ":=", 
   RowBox[{"Grid", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"M", "/@", "stack"}], "}"}], ",", 
     RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]}]}]}], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Unit Tests", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"pstack", ",", "qstack", ",", "pqstack", ",", "ranstack"}], "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"pstack", "=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", "}"}], ",", "p"}], "}"}], "/.", "pushR"}], ")"}]}], 
  ";"}], "\n", 
 RowBox[{
  RowBox[{"qstack", "=", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", "}"}], ",", "q"}], "}"}], "/.", "pushR"}], ")"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"pqstack", "=", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", "}"}], ",", "p"}], "}"}], "/.", "pushR"}], ",", "q"}], 
     "}"}], "/.", "pushR"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"ranmat", "[", "]"}], ":=", 
   RowBox[{"RandomReal", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"0.", ",", "1."}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", "4"}], "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ranstack", "[", 
   RowBox[{"n_:", "1"}], "]"}], ":=", 
  RowBox[{"Fold", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"{", 
       RowBox[{"#1", ",", "#2"}], "}"}], "/.", "pushR"}], "&"}], ",", 
    RowBox[{"{", "}"}], ",", 
    RowBox[{"RandomReal", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"0.", ",", "1."}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"n", ",", "4", ",", "4"}], "}"}]}], "]"}]}], "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell["conj2", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"M", "@", 
  RowBox[{"(", 
   RowBox[{"iul", ".", "p", ".", 
    RowBox[{"(", 
     RowBox[{"T", "@", "ill"}], ")"}]}], ")"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "a", "b"},
     {"0", "0", "c", "d"},
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ul", ",", "p", ",", "ll", ",", "conj2"}], "}"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ul",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["ll",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj2",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "a", "b"},
             {"0", "0", "c", "d"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ll", ",", "p", ",", "ul", ",", "conj2"}], "}"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ll",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["ul",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj2",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"a", "b", "0", "0"},
             {"c", "d", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ll", ",", "p", ",", "ll", ",", "conj2"}], "}"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ll",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["ll",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj2",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "a", "b"},
             {"0", "0", "c", "d"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["conj2I", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"execAllTrace", "[", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"q", ",", "p", ",", "p", ",", "conj2I"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"x", "y", "\[Xi]", "\[Psi]"},
         {"z", "w", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj2I",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["plus", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execTrace", "[", 
  RowBox[{"pqstack", ",", "plus"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {
          RowBox[{"a", "+", "x"}], 
          RowBox[{"b", "+", "y"}], 
          RowBox[{"\[Alpha]", "+", "\[Xi]"}], 
          RowBox[{"\[Beta]", "+", "\[Psi]"}]},
         {
          RowBox[{"c", "+", "z"}], 
          RowBox[{"d", "+", "w"}], 
          RowBox[{"\[Gamma]", "+", "\[Zeta]"}], 
          RowBox[{"\[Delta]", "+", "\[Omega]"}]},
         {
          RowBox[{"\[ScriptCapitalA]", "+", "\[ScriptCapitalX]"}], 
          RowBox[{"\[ScriptCapitalB]", "+", "\[ScriptCapitalY]"}], 
          RowBox[{"\[DoubleStruckCapitalA]", "+", "\[DoubleStruckCapitalX]"}], 
          RowBox[{"\[DoubleStruckCapitalB]", "+", "\[DoubleStruckCapitalY]"}]},
         {
          RowBox[{"\[ScriptCapitalC]", "+", "\[ScriptCapitalZ]"}], 
          RowBox[{"\[ScriptCapitalD]", "+", "\[ScriptCapitalW]"}], 
          RowBox[{"\[DoubleStruckCapitalC]", "+", "\[DoubleStruckCapitalZ]"}], 
          RowBox[{"\[DoubleStruckCapitalD]", "+", "\[DoubleStruckCapitalW]"}]}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execTrace", "[", 
  RowBox[{"qstack", ",", "plus"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"x", "y", "\[Xi]", "\[Psi]"},
         {"z", "w", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", "plus"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{"pqstack", ",", 
   RowBox[{"{", "plus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["plus",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{"a", "+", "x"}], 
              RowBox[{"b", "+", "y"}], 
              RowBox[{"\[Alpha]", "+", "\[Xi]"}], 
              RowBox[{"\[Beta]", "+", "\[Psi]"}]},
             {
              RowBox[{"c", "+", "z"}], 
              RowBox[{"d", "+", "w"}], 
              RowBox[{"\[Gamma]", "+", "\[Zeta]"}], 
              RowBox[{"\[Delta]", "+", "\[Omega]"}]},
             {
              RowBox[{"\[ScriptCapitalA]", "+", "\[ScriptCapitalX]"}], 
              RowBox[{"\[ScriptCapitalB]", "+", "\[ScriptCapitalY]"}], 
              RowBox[{
              "\[DoubleStruckCapitalA]", "+", "\[DoubleStruckCapitalX]"}], 
              RowBox[{
              "\[DoubleStruckCapitalB]", "+", "\[DoubleStruckCapitalY]"}]},
             {
              RowBox[{"\[ScriptCapitalC]", "+", "\[ScriptCapitalZ]"}], 
              RowBox[{"\[ScriptCapitalD]", "+", "\[ScriptCapitalW]"}], 
              RowBox[{
              "\[DoubleStruckCapitalC]", "+", "\[DoubleStruckCapitalZ]"}], 
              RowBox[{
              "\[DoubleStruckCapitalD]", "+", "\[DoubleStruckCapitalW]"}]}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"ranstack", "[", "2", "]"}], ",", 
   RowBox[{"{", "plus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.8246462559264582`", "0.8992853557975109`", 
              "0.5929545519285337`", "0.2994526390582828`"},
             {"0.17788829159147945`", "0.0573378992885365`", 
              "0.7519828867459131`", "0.7094059089949678`"},
             {"0.24176498946658187`", "0.5837700759291338`", 
              "0.4162882973944242`", "0.9679678523650195`"},
             {"0.934604889561047`", "0.3321880139624338`", 
              "0.8461624300750654`", "0.6845893291646716`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.9706333792221351`", "0.7877965380822385`", 
              "0.28163113893947744`", "0.7521856938455338`"},
             {"0.9544900270603556`", "0.4225536563763048`", 
              "0.0976751917389791`", "0.24780770476608494`"},
             {"0.1582259574565592`", "0.7535455666523732`", 
              "0.9169283699531612`", "0.21457455917427581`"},
             {"0.08014822794417475`", "0.1737898424451083`", 
              "0.038087563389922474`", "0.31394340574339585`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["plus",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1.7952796351485933`", "1.6870818938797494`", 
              "0.8745856908680112`", "1.0516383329038166`"},
             {"1.132378318651835`", "0.4798915556648413`", 
              "0.8496580784848922`", "0.9572136137610527`"},
             {"0.3999909469231411`", "1.337315642581507`", 
              "1.3332166673475854`", "1.1825424115392953`"},
             {"1.0147531175052218`", "0.5059778564075421`", 
              "0.8842499934649879`", "0.9985327349080675`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["dot", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{"pqstack", ",", 
   RowBox[{"{", "dot", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["dot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{
               RowBox[{"a", " ", "x"}], "+", 
               RowBox[{"b", " ", "z"}], "+", 
               RowBox[{"\[ScriptCapitalX]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[ScriptCapitalZ]", " ", "\[Beta]"}]}], 
              RowBox[{
               RowBox[{"b", " ", "w"}], "+", 
               RowBox[{"a", " ", "y"}], "+", 
               RowBox[{"\[ScriptCapitalY]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[ScriptCapitalW]", " ", "\[Beta]"}]}], 
              RowBox[{
               RowBox[{"\[DoubleStruckCapitalX]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalZ]", " ", "\[Beta]"}], "+", 
               RowBox[{"b", " ", "\[Zeta]"}], "+", 
               RowBox[{"a", " ", "\[Xi]"}]}], 
              RowBox[{
               RowBox[{"\[DoubleStruckCapitalY]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalW]", " ", "\[Beta]"}], "+", 
               RowBox[{"a", " ", "\[Psi]"}], "+", 
               RowBox[{"b", " ", "\[Omega]"}]}]},
             {
              RowBox[{
               RowBox[{"c", " ", "x"}], "+", 
               RowBox[{"d", " ", "z"}], "+", 
               RowBox[{"\[ScriptCapitalX]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[ScriptCapitalZ]", " ", "\[Delta]"}]}], 
              RowBox[{
               RowBox[{"d", " ", "w"}], "+", 
               RowBox[{"c", " ", "y"}], "+", 
               RowBox[{"\[ScriptCapitalY]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[ScriptCapitalW]", " ", "\[Delta]"}]}], 
              RowBox[{
               RowBox[{"\[DoubleStruckCapitalX]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalZ]", " ", "\[Delta]"}], "+", 
               RowBox[{"d", " ", "\[Zeta]"}], "+", 
               RowBox[{"c", " ", "\[Xi]"}]}], 
              RowBox[{
               RowBox[{"\[DoubleStruckCapitalY]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalW]", " ", "\[Delta]"}], "+", 
               RowBox[{"c", " ", "\[Psi]"}], "+", 
               RowBox[{"d", " ", "\[Omega]"}]}]},
             {
              RowBox[{
               RowBox[{"x", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"z", " ", "\[ScriptCapitalB]"}], "+", 
               RowBox[{"\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalA]"}], 
               "+", 
               RowBox[{
               "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalB]"}]}], 
              RowBox[{
               RowBox[{"y", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"w", " ", "\[ScriptCapitalB]"}], "+", 
               RowBox[{"\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalA]"}], 
               "+", 
               RowBox[{
               "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalB]"}]}], 
              RowBox[{
               RowBox[{
               "\[DoubleStruckCapitalA]", " ", "\[DoubleStruckCapitalX]"}], 
               "+", 
               RowBox[{
               "\[DoubleStruckCapitalB]", " ", "\[DoubleStruckCapitalZ]"}], 
               "+", 
               RowBox[{"\[ScriptCapitalB]", " ", "\[Zeta]"}], "+", 
               RowBox[{"\[ScriptCapitalA]", " ", "\[Xi]"}]}], 
              RowBox[{
               RowBox[{
               "\[DoubleStruckCapitalB]", " ", "\[DoubleStruckCapitalW]"}], 
               "+", 
               RowBox[{
               "\[DoubleStruckCapitalA]", " ", "\[DoubleStruckCapitalY]"}], 
               "+", 
               RowBox[{"\[ScriptCapitalA]", " ", "\[Psi]"}], "+", 
               RowBox[{"\[ScriptCapitalB]", " ", "\[Omega]"}]}]},
             {
              RowBox[{
               RowBox[{"x", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"z", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{"\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalC]"}], 
               "+", 
               RowBox[{
               "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalD]"}]}], 
              RowBox[{
               RowBox[{"y", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"w", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{"\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalC]"}], 
               "+", 
               RowBox[{
               "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalD]"}]}], 
              RowBox[{
               RowBox[{
               "\[DoubleStruckCapitalC]", " ", "\[DoubleStruckCapitalX]"}], 
               "+", 
               RowBox[{
               "\[DoubleStruckCapitalD]", " ", "\[DoubleStruckCapitalZ]"}], 
               "+", 
               RowBox[{"\[ScriptCapitalD]", " ", "\[Zeta]"}], "+", 
               RowBox[{"\[ScriptCapitalC]", " ", "\[Xi]"}]}], 
              RowBox[{
               RowBox[{
               "\[DoubleStruckCapitalD]", " ", "\[DoubleStruckCapitalW]"}], 
               "+", 
               RowBox[{
               "\[DoubleStruckCapitalC]", " ", "\[DoubleStruckCapitalY]"}], 
               "+", 
               RowBox[{"\[ScriptCapitalC]", " ", "\[Psi]"}], "+", 
               RowBox[{"\[ScriptCapitalD]", " ", "\[Omega]"}]}]}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"ranstack", "[", "2", "]"}], ",", 
   RowBox[{"{", "dot", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.8805843410578573`", "0.014787076106296704`", 
              "0.12184623548824014`", "0.001458142638476323`"},
             {"0.9474649576482181`", "0.09958144272297931`", 
              "0.05044843743116001`", "0.6190787474510928`"},
             {"0.7085706961814131`", "0.3926668511190563`", 
              "0.9276659230630544`", "0.4560762990721827`"},
             {"0.2043944773083859`", "0.930135996653717`", 
              "0.3897149171776575`", "0.622714815201233`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.9151371141995843`", "0.45949571145487145`", 
              "0.12341225855652338`", "0.01549867052618481`"},
             {"0.3654098187779735`", "0.65990016587484`", 
              "0.10622779725378773`", "0.026707791568047812`"},
             {"0.12950218671874092`", "0.7376999368286505`", 
              "0.13653633683514887`", "0.9461347240001552`"},
             {"0.7076914987280887`", "0.5804378166650712`", 
              "0.057544184855710556`", "0.536468005121129`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["dot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.8280700245736445`", "0.5051150436176955`", 
              "0.12696604718230578`", "0.13010801797569058`"},
             {"1.3480983336647254`", "0.8976224209844078`", 
              "0.17001953436381895`", "0.3971910067131309`"},
             {"1.2348197502232585`", "1.533769140452819`", 
              "0.2820630904156192`", "1.1438364526078881`"},
             {"1.0180887129197982`", "1.3566551817697485`", 
              "0.21307494579186897`", "0.7307991112627445`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["minus", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{"pqstack", ",", 
   RowBox[{"{", "minus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["minus",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{"a", "-", "x"}], 
              RowBox[{"b", "-", "y"}], 
              RowBox[{"\[Alpha]", "-", "\[Xi]"}], 
              RowBox[{"\[Beta]", "-", "\[Psi]"}]},
             {
              RowBox[{"c", "-", "z"}], 
              RowBox[{"d", "-", "w"}], 
              RowBox[{"\[Gamma]", "-", "\[Zeta]"}], 
              RowBox[{"\[Delta]", "-", "\[Omega]"}]},
             {
              RowBox[{"\[ScriptCapitalA]", "-", "\[ScriptCapitalX]"}], 
              RowBox[{"\[ScriptCapitalB]", "-", "\[ScriptCapitalY]"}], 
              RowBox[{
              "\[DoubleStruckCapitalA]", "-", "\[DoubleStruckCapitalX]"}], 
              RowBox[{
              "\[DoubleStruckCapitalB]", "-", "\[DoubleStruckCapitalY]"}]},
             {
              RowBox[{"\[ScriptCapitalC]", "-", "\[ScriptCapitalZ]"}], 
              RowBox[{"\[ScriptCapitalD]", "-", "\[ScriptCapitalW]"}], 
              RowBox[{
              "\[DoubleStruckCapitalC]", "-", "\[DoubleStruckCapitalZ]"}], 
              RowBox[{
              "\[DoubleStruckCapitalD]", "-", "\[DoubleStruckCapitalW]"}]}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["div", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"foo", "=", 
      RowBox[{"ranmat", "[", "]"}]}], ",", " ", 
     RowBox[{"bar", "=", 
      RowBox[{"ranmat", "[", "]"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"execAllTrace", "[", 
    RowBox[{
     RowBox[{"{", "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
      "foo", ",", "bar", ",", "div", ",", "bar", ",", "dot", ",", "foo", ",", 
       "minus"}], "}"}]}], "]"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.17423393035010282`", "0.39118121584012355`", 
          "0.03403590087442665`", "0.858019336033016`"},
         {"0.10911269876592966`", "0.6479571763774963`", 
          "0.22369839486426857`", "0.010250437972092685`"},
         {"0.3217177578779331`", "0.3088748202798346`", 
          "0.18824064191823076`", "0.8885580457811604`"},
         {"0.3946054037347997`", "0.1770876563364785`", 
          "0.21074996018382053`", "0.4321634216281256`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.17423393035010282`", "0.39118121584012355`", 
              "0.03403590087442665`", "0.858019336033016`"},
             {"0.10911269876592966`", "0.6479571763774963`", 
              "0.22369839486426857`", "0.010250437972092685`"},
             {"0.3217177578779331`", "0.3088748202798346`", 
              "0.18824064191823076`", "0.8885580457811604`"},
             {"0.3946054037347997`", "0.1770876563364785`", 
              "0.21074996018382053`", "0.4321634216281256`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.1957561333537381`", "0.7695090955148922`", "0.5646655712552562`",
           "0.23760825353289405`"},
         {"0.6026888010027858`", "0.5812926807914875`", "0.8493109893723498`",
           "0.2692834904236727`"},
         {"0.4674912504684805`", "0.96333344590286`", "0.6663701780891618`", 
          "0.04720001926724704`"},
         {"0.08927218464694198`", "0.7752992925278763`", 
          "0.46161171517768707`", "0.3332406309172298`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.17423393035010282`", "0.39118121584012355`", 
              "0.03403590087442665`", "0.858019336033016`"},
             {"0.10911269876592966`", "0.6479571763774963`", 
              "0.22369839486426857`", "0.010250437972092685`"},
             {"0.3217177578779331`", "0.3088748202798346`", 
              "0.18824064191823076`", "0.8885580457811604`"},
             {"0.3946054037347997`", "0.1770876563364785`", 
              "0.21074996018382053`", "0.4321634216281256`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.1957561333537381`", "0.7695090955148922`", 
              "0.5646655712552562`", "0.23760825353289405`"},
             {"0.6026888010027858`", "0.5812926807914875`", 
              "0.8493109893723498`", "0.2692834904236727`"},
             {"0.4674912504684805`", "0.96333344590286`", 
              "0.6663701780891618`", "0.04720001926724704`"},
             {"0.08927218464694198`", "0.7752992925278763`", 
              "0.46161171517768707`", "0.3332406309172298`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["div",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{"-", "11.179648474731172`"}], "1.7768722400901165`", 
              "1.0520543753553553`", "8.961262410801092`"},
             {
              RowBox[{"-", "0.3352539237849788`"}], 
              RowBox[{"-", "0.3978300874839667`"}], "0.7952646410050046`", 
              "0.4786394294984684`"},
             {
              RowBox[{"-", "10.922773196379268`"}], "2.1676793257273013`", 
              "0.8278602467326465`", "8.58569924767648`"},
             {
              RowBox[{"-", "6.859661728367982`"}], "1.5041843493361515`", 
              "0.8507686360673382`", "4.851951433525597`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.1957561333537381`", "0.7695090955148922`", "0.5646655712552562`",
           "0.23760825353289405`"},
         {"0.6026888010027858`", "0.5812926807914875`", "0.8493109893723498`",
           "0.2692834904236727`"},
         {"0.4674912504684805`", "0.96333344590286`", "0.6663701780891618`", 
          "0.04720001926724704`"},
         {"0.08927218464694198`", "0.7752992925278763`", 
          "0.46161171517768707`", "0.3332406309172298`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{"-", "11.179648474731172`"}], "1.7768722400901165`", 
              "1.0520543753553553`", "8.961262410801092`"},
             {
              RowBox[{"-", "0.3352539237849788`"}], 
              RowBox[{"-", "0.3978300874839667`"}], "0.7952646410050046`", 
              "0.4786394294984684`"},
             {
              RowBox[{"-", "10.922773196379268`"}], "2.1676793257273013`", 
              "0.8278602467326465`", "8.58569924767648`"},
             {
              RowBox[{"-", "6.859661728367982`"}], "1.5041843493361515`", 
              "0.8507686360673382`", "4.851951433525597`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.1957561333537381`", "0.7695090955148922`", 
              "0.5646655712552562`", "0.23760825353289405`"},
             {"0.6026888010027858`", "0.5812926807914875`", 
              "0.8493109893723498`", "0.2692834904236727`"},
             {"0.4674912504684805`", "0.96333344590286`", 
              "0.6663701780891618`", "0.04720001926724704`"},
             {"0.08927218464694198`", "0.7752992925278763`", 
              "0.46161171517768707`", "0.3332406309172298`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["dot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.17423393035010293`", "0.391181215840124`", 
              "0.03403590087442776`", "0.8580193360330157`"},
             {"0.10911269876592955`", "0.6479571763774961`", 
              "0.2236983948642683`", "0.010250437972092658`"},
             {"0.32171775787793383`", "0.3088748202798355`", 
              "0.18824064191823098`", "0.8885580457811602`"},
             {"0.3946054037347999`", "0.1770876563364796`", 
              "0.2107499601838203`", "0.4321634216281256`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.17423393035010282`", "0.39118121584012355`", 
          "0.03403590087442665`", "0.858019336033016`"},
         {"0.10911269876592966`", "0.6479571763774963`", 
          "0.22369839486426857`", "0.010250437972092685`"},
         {"0.3217177578779331`", "0.3088748202798346`", 
          "0.18824064191823076`", "0.8885580457811604`"},
         {"0.3946054037347997`", "0.1770876563364785`", 
          "0.21074996018382053`", "0.4321634216281256`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.17423393035010293`", "0.391181215840124`", 
              "0.03403590087442776`", "0.8580193360330157`"},
             {"0.10911269876592955`", "0.6479571763774961`", 
              "0.2236983948642683`", "0.010250437972092658`"},
             {"0.32171775787793383`", "0.3088748202798355`", 
              "0.18824064191823098`", "0.8885580457811602`"},
             {"0.3946054037347999`", "0.1770876563364796`", 
              "0.2107499601838203`", "0.4321634216281256`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.17423393035010282`", "0.39118121584012355`", 
              "0.03403590087442665`", "0.858019336033016`"},
             {"0.10911269876592966`", "0.6479571763774963`", 
              "0.22369839486426857`", "0.010250437972092685`"},
             {"0.3217177578779331`", "0.3088748202798346`", 
              "0.18824064191823076`", "0.8885580457811604`"},
             {"0.3946054037347997`", "0.1770876563364785`", 
              "0.21074996018382053`", "0.4321634216281256`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["minus",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{"pqstack", ",", 
   RowBox[{"{", "div", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["div",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{
               FractionBox[
                RowBox[{"\[Beta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Zeta]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Alpha]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"b", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "z"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"a", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[Beta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Xi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Alpha]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"b", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"a", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[Beta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalZ]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Alpha]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalW]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalW]"}], 
                   "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"a", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"b", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[Beta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalX]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalX]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Xi]"}], "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Alpha]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalY]"}], 
                   "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"b", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"a", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}]},
             {
              RowBox[{
               FractionBox[
                RowBox[{"\[Delta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Zeta]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Gamma]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"d", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "z"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"c", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[Delta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Xi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Gamma]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"d", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"c", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[Delta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalZ]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Gamma]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalW]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalW]"}], 
                   "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"c", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"d", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[Delta]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalX]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalX]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Xi]"}], "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[Gamma]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalY]"}], 
                   "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"d", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"c", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}]},
             {
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Zeta]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "z"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Xi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalZ]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalW]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalW]"}], 
                   "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalX]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalX]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Xi]"}], "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalY]"}], 
                   "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalB]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalA]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}]},
             {
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Zeta]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "z", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "w", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "z"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Omega]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Omega]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Xi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[ScriptCapitalX]", " ", 
                    "\[DoubleStruckCapitalW]"}], "-", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalY]", " ", 
                    "\[DoubleStruckCapitalW]"}], "+", 
                   RowBox[{
                   "x", " ", "\[ScriptCapitalW]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "y", " ", "\[ScriptCapitalZ]", " ", 
                    "\[DoubleStruckCapitalY]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[DoubleStruckCapitalX]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Xi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Xi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[DoubleStruckCapitalX]", " ", 
                    "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[DoubleStruckCapitalZ]", " ", 
                    "\[Psi]"}]}], ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalZ]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalZ]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalW]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalW]"}], 
                   "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalW]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalZ]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalW]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalZ]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalW]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "x"}], " ", "\[DoubleStruckCapitalW]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalZ]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}], 
              RowBox[{
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"w", " ", "x", " ", "\[DoubleStruckCapitalX]"}], 
                   "-", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalX]"}], 
                   "+", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Zeta]"}], 
                   "-", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Xi]"}], "+", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Xi]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[DoubleStruckCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "w"}], " ", "x", " ", 
                    "\[DoubleStruckCapitalY]"}], "+", 
                   RowBox[{"y", " ", "z", " ", "\[DoubleStruckCapitalY]"}], 
                   "+", 
                   RowBox[{"w", " ", "\[ScriptCapitalX]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"z", " ", "\[ScriptCapitalY]", " ", "\[Psi]"}], 
                   "-", 
                   RowBox[{"y", " ", "\[ScriptCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{"x", " ", "\[ScriptCapitalY]", " ", "\[Omega]"}]}],
                   ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalD]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                   RowBox[{
                   "z", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Zeta]", " ", "\[Psi]"}], "-", 
                   RowBox[{
                   "x", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "+", 
                   RowBox[{
                   "\[ScriptCapitalX]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]], "+", 
               FractionBox[
                RowBox[{"\[ScriptCapitalC]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "y"}], " ", "\[DoubleStruckCapitalY]", " ", 
                    "\[Zeta]"}], "+", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "-", 
                   RowBox[{
                   "w", " ", "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Zeta]", " ", "\[Psi]"}], "+", 
                   RowBox[{
                   "y", " ", "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], 
                   "-", 
                   RowBox[{
                   "\[ScriptCapitalY]", " ", "\[Xi]", " ", "\[Omega]"}]}], 
                  ")"}]}], 
                RowBox[{
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]"}], "-", 
                 RowBox[{
                 "w", " ", "x", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "z", " ", "\[DoubleStruckCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Zeta]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Zeta]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalW]", " ", "\[Xi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalY]", " ", "\[Xi]"}], "+", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "w", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "z", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", 
                  "\[Zeta]", " ", "\[Psi]"}], "-", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalW]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalZ]", " ", 
                  "\[DoubleStruckCapitalX]", " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "y", " ", "\[ScriptCapitalX]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "x", " ", "\[ScriptCapitalY]", " ", 
                  "\[DoubleStruckCapitalZ]", " ", "\[Omega]"}], "+", 
                 RowBox[{
                 "\[ScriptCapitalW]", " ", "\[ScriptCapitalX]", " ", "\[Xi]", 
                  " ", "\[Omega]"}], "-", 
                 RowBox[{
                 "\[ScriptCapitalY]", " ", "\[ScriptCapitalZ]", " ", "\[Xi]", 
                  " ", "\[Omega]"}]}]]}]}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["conj", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ul", ",", "p", ",", "conj"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ul",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "0", "0"},
             {"c", "d", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ur", ",", "p", ",", "conj"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ur",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]", "0", "0"},
             {"\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ll", ",", "p", ",", "conj"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ll",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "a", "b"},
             {"0", "0", "c", "d"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"lr", ",", "p", ",", "conj"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["lr",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conj",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"0", "0", "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["conjI", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"execAllTrace", "[", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"p", ",", "trueMatrix", ",", "conjI"}], "}"}]}], "]"}], "//", 
  "FullSimplify"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "1", "0", "0"},
         {"0", "0", "1", "0"},
         {"0", "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["conjI",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["comm", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "ul", ",", "comm"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["ul",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["comm",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{
               SuperscriptBox["a", "2"], "+", 
               SuperscriptBox["b", "2"]}], 
              RowBox[{
               RowBox[{"a", " ", "c"}], "+", 
               RowBox[{"b", " ", "d"}]}], "0", "0"},
             {
              RowBox[{
               RowBox[{"a", " ", "c"}], "+", 
               RowBox[{"b", " ", "d"}]}], 
              RowBox[{
               SuperscriptBox["c", "2"], "+", 
               SuperscriptBox["d", "2"]}], "0", "0"},
             {
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalB]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalB]"}]}], "0", "0"},
             {
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalD]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalD]"}]}], "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"trueMatrix", ",", "p", ",", "comm"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "1", "0", "0"},
         {"0", "0", "1", "0"},
         {"0", "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "1", "0"},
             {"0", "0", "0", "1"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["comm",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{
               SuperscriptBox["a", "2"], "+", 
               SuperscriptBox["b", "2"], "+", 
               SuperscriptBox["\[Alpha]", "2"], "+", 
               SuperscriptBox["\[Beta]", "2"]}], 
              RowBox[{
               RowBox[{"a", " ", "c"}], "+", 
               RowBox[{"b", " ", "d"}], "+", 
               RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[Beta]", " ", "\[Delta]"}]}], 
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalB]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalA]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalB]", " ", "\[Beta]"}]}], 
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalC]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalD]", " ", "\[Beta]"}]}]},
             {
              RowBox[{
               RowBox[{"a", " ", "c"}], "+", 
               RowBox[{"b", " ", "d"}], "+", 
               RowBox[{"\[Alpha]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[Beta]", " ", "\[Delta]"}]}], 
              RowBox[{
               SuperscriptBox["c", "2"], "+", 
               SuperscriptBox["d", "2"], "+", 
               SuperscriptBox["\[Gamma]", "2"], "+", 
               SuperscriptBox["\[Delta]", "2"]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalB]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalA]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalB]", " ", "\[Delta]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalC]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalD]", " ", "\[Delta]"}]}]},
             {
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalB]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalA]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalB]", " ", "\[Beta]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalB]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalA]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalB]", " ", "\[Delta]"}]}], 
              RowBox[{
               SuperscriptBox["\[ScriptCapitalA]", "2"], "+", 
               SuperscriptBox["\[ScriptCapitalB]", "2"], "+", 
               SuperscriptBox["\[DoubleStruckCapitalA]", "2"], "+", 
               SuperscriptBox["\[DoubleStruckCapitalB]", "2"]}], 
              RowBox[{
               RowBox[{"\[ScriptCapitalA]", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"\[ScriptCapitalB]", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{
               "\[DoubleStruckCapitalA]", " ", "\[DoubleStruckCapitalC]"}], 
               "+", 
               RowBox[{
               "\[DoubleStruckCapitalB]", " ", "\[DoubleStruckCapitalD]"}]}]},
             {
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalC]", " ", "\[Alpha]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalD]", " ", "\[Beta]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalC]", " ", "\[Gamma]"}], "+", 
               RowBox[{"\[DoubleStruckCapitalD]", " ", "\[Delta]"}]}], 
              RowBox[{
               RowBox[{"\[ScriptCapitalA]", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"\[ScriptCapitalB]", " ", "\[ScriptCapitalD]"}], "+", 
               RowBox[{
               "\[DoubleStruckCapitalA]", " ", "\[DoubleStruckCapitalC]"}], 
               "+", 
               RowBox[{
               "\[DoubleStruckCapitalB]", " ", "\[DoubleStruckCapitalD]"}]}], 
              RowBox[{
               SuperscriptBox["\[ScriptCapitalC]", "2"], "+", 
               SuperscriptBox["\[ScriptCapitalD]", "2"], "+", 
               SuperscriptBox["\[DoubleStruckCapitalC]", "2"], "+", 
               SuperscriptBox["\[DoubleStruckCapitalD]", "2"]}]}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell["commI", "Subsubsection"],

Cell[CellGroupData[{

Cell["uminus", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "uminus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["uminus",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{"-", "a"}], 
              RowBox[{"-", "b"}], 
              RowBox[{"-", "\[Alpha]"}], 
              RowBox[{"-", "\[Beta]"}]},
             {
              RowBox[{"-", "c"}], 
              RowBox[{"-", "d"}], 
              RowBox[{"-", "\[Gamma]"}], 
              RowBox[{"-", "\[Delta]"}]},
             {
              RowBox[{"-", "\[ScriptCapitalA]"}], 
              RowBox[{"-", "\[ScriptCapitalB]"}], 
              RowBox[{"-", "\[DoubleStruckCapitalA]"}], 
              RowBox[{"-", "\[DoubleStruckCapitalB]"}]},
             {
              RowBox[{"-", "\[ScriptCapitalC]"}], 
              RowBox[{"-", "\[ScriptCapitalD]"}], 
              RowBox[{"-", "\[DoubleStruckCapitalC]"}], 
              RowBox[{"-", "\[DoubleStruckCapitalD]"}]}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["inv", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execTrace", "[", 
  RowBox[{"pstack", ",", "inv"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "d"}], " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "+", 
            RowBox[{
            "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", " ", 
             "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", " ", 
             "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
            "b", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "-", 
            RowBox[{
            "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[Alpha]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", " ", 
             "\[Alpha]"}], "+", 
            RowBox[{
            "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[Beta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", " ", 
             "\[Beta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "d"}], " ", "\[DoubleStruckCapitalD]", " ", 
             "\[Alpha]"}], "+", 
            RowBox[{"d", " ", "\[DoubleStruckCapitalC]", " ", "\[Beta]"}], 
            "+", 
            RowBox[{"b", " ", "\[DoubleStruckCapitalD]", " ", "\[Gamma]"}], 
            "-", 
            RowBox[{"\[ScriptCapitalD]", " ", "\[Beta]", " ", "\[Gamma]"}], 
            "-", 
            RowBox[{"b", " ", "\[DoubleStruckCapitalC]", " ", "\[Delta]"}], 
            "+", 
            RowBox[{"\[ScriptCapitalD]", " ", "\[Alpha]", " ", "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{"d", " ", "\[DoubleStruckCapitalB]", " ", "\[Alpha]"}], 
            "-", 
            RowBox[{"d", " ", "\[DoubleStruckCapitalA]", " ", "\[Beta]"}], 
            "-", 
            RowBox[{"b", " ", "\[DoubleStruckCapitalB]", " ", "\[Gamma]"}], 
            "+", 
            RowBox[{"\[ScriptCapitalB]", " ", "\[Beta]", " ", "\[Gamma]"}], 
            "+", 
            RowBox[{"b", " ", "\[DoubleStruckCapitalA]", " ", "\[Delta]"}], 
            "-", 
            RowBox[{"\[ScriptCapitalB]", " ", "\[Alpha]", " ", "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]]},
         {
          FractionBox[
           RowBox[{
            RowBox[{
            "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "-", 
            RowBox[{
            "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", " ", 
             "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", " ", 
             "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "a"}], " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "+", 
            RowBox[{
            "a", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[Alpha]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", " ", 
             "\[Alpha]"}], "-", 
            RowBox[{
            "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[Beta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", " ", 
             "\[Beta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{"c", " ", "\[DoubleStruckCapitalD]", " ", "\[Alpha]"}], 
            "-", 
            RowBox[{"c", " ", "\[DoubleStruckCapitalC]", " ", "\[Beta]"}], 
            "-", 
            RowBox[{"a", " ", "\[DoubleStruckCapitalD]", " ", "\[Gamma]"}], 
            "+", 
            RowBox[{"\[ScriptCapitalC]", " ", "\[Beta]", " ", "\[Gamma]"}], 
            "+", 
            RowBox[{"a", " ", "\[DoubleStruckCapitalC]", " ", "\[Delta]"}], 
            "-", 
            RowBox[{"\[ScriptCapitalC]", " ", "\[Alpha]", " ", "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "c"}], " ", "\[DoubleStruckCapitalB]", " ", 
             "\[Alpha]"}], "+", 
            RowBox[{"c", " ", "\[DoubleStruckCapitalA]", " ", "\[Beta]"}], 
            "+", 
            RowBox[{"a", " ", "\[DoubleStruckCapitalB]", " ", "\[Gamma]"}], 
            "-", 
            RowBox[{"\[ScriptCapitalA]", " ", "\[Beta]", " ", "\[Gamma]"}], 
            "-", 
            RowBox[{"a", " ", "\[DoubleStruckCapitalA]", " ", "\[Delta]"}], 
            "+", 
            RowBox[{"\[ScriptCapitalA]", " ", "\[Alpha]", " ", "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]]},
         {
          FractionBox[
           RowBox[{
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]"}], 
            "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]"}], 
            "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]"}], 
            "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]"}], 
            "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Delta]"}], 
            "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", 
             "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "b"}], " ", "\[ScriptCapitalC]", " ", 
             "\[DoubleStruckCapitalB]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]"}], 
            "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]"}], 
            "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]"}], 
            "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]"}], 
            "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "b"}], " ", "c", " ", "\[DoubleStruckCapitalD]"}], 
            "+", 
            RowBox[{"a", " ", "d", " ", "\[DoubleStruckCapitalD]"}], "-", 
            RowBox[{"d", " ", "\[ScriptCapitalC]", " ", "\[Beta]"}], "+", 
            RowBox[{"c", " ", "\[ScriptCapitalD]", " ", "\[Beta]"}], "+", 
            RowBox[{"b", " ", "\[ScriptCapitalC]", " ", "\[Delta]"}], "-", 
            RowBox[{"a", " ", "\[ScriptCapitalD]", " ", "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{"b", " ", "c", " ", "\[DoubleStruckCapitalB]"}], "-", 
            RowBox[{"a", " ", "d", " ", "\[DoubleStruckCapitalB]"}], "+", 
            RowBox[{"d", " ", "\[ScriptCapitalA]", " ", "\[Beta]"}], "-", 
            RowBox[{"c", " ", "\[ScriptCapitalB]", " ", "\[Beta]"}], "-", 
            RowBox[{"b", " ", "\[ScriptCapitalA]", " ", "\[Delta]"}], "+", 
            RowBox[{"a", " ", "\[ScriptCapitalB]", " ", "\[Delta]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]]},
         {
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "d"}], " ", "\[ScriptCapitalC]", " ", 
             "\[DoubleStruckCapitalA]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]"}], 
            "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]"}], 
            "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]"}], 
            "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Gamma]"}], 
            "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", 
             "\[Gamma]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]"}], 
            "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]"}], 
            "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]"}], 
            "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]"}], 
            "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]"}], 
            "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", 
             "\[Alpha]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{"b", " ", "c", " ", "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{"a", " ", "d", " ", "\[DoubleStruckCapitalC]"}], "+", 
            RowBox[{"d", " ", "\[ScriptCapitalC]", " ", "\[Alpha]"}], "-", 
            RowBox[{"c", " ", "\[ScriptCapitalD]", " ", "\[Alpha]"}], "-", 
            RowBox[{"b", " ", "\[ScriptCapitalC]", " ", "\[Gamma]"}], "+", 
            RowBox[{"a", " ", "\[ScriptCapitalD]", " ", "\[Gamma]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]], 
          FractionBox[
           RowBox[{
            RowBox[{
             RowBox[{"-", "b"}], " ", "c", " ", "\[DoubleStruckCapitalA]"}], 
            "+", 
            RowBox[{"a", " ", "d", " ", "\[DoubleStruckCapitalA]"}], "-", 
            RowBox[{"d", " ", "\[ScriptCapitalA]", " ", "\[Alpha]"}], "+", 
            RowBox[{"c", " ", "\[ScriptCapitalB]", " ", "\[Alpha]"}], "+", 
            RowBox[{"b", " ", "\[ScriptCapitalA]", " ", "\[Gamma]"}], "-", 
            RowBox[{"a", " ", "\[ScriptCapitalB]", " ", "\[Gamma]"}]}], 
           RowBox[{
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalB]", " ", 
             "\[DoubleStruckCapitalC]"}], "-", 
            RowBox[{
            "b", " ", "c", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "a", " ", "d", " ", "\[DoubleStruckCapitalA]", " ", 
             "\[DoubleStruckCapitalD]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Alpha]"}], "-", 
            RowBox[{
            "d", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "c", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Beta]"}], "+", 
            RowBox[{
            "d", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "c", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Beta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalB]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalD]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "-", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Beta]", 
             " ", "\[Gamma]"}], "+", 
            RowBox[{
            "b", " ", "\[ScriptCapitalC]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "a", " ", "\[ScriptCapitalD]", " ", "\[DoubleStruckCapitalA]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "b", " ", "\[ScriptCapitalA]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "a", " ", "\[ScriptCapitalB]", " ", "\[DoubleStruckCapitalC]", 
             " ", "\[Delta]"}], "-", 
            RowBox[{
            "\[ScriptCapitalB]", " ", "\[ScriptCapitalC]", " ", "\[Alpha]", 
             " ", "\[Delta]"}], "+", 
            RowBox[{
            "\[ScriptCapitalA]", " ", "\[ScriptCapitalD]", " ", "\[Alpha]", 
             " ", "\[Delta]"}]}]]}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"With", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"r", "=", 
     RowBox[{"ranmat", "[", "]"}]}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"execAllTrace", "[", 
    RowBox[{
     RowBox[{"{", "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"r", ",", "r", ",", "inv", ",", "dot"}], "}"}]}], "]"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.09271037449676078`", "0.1237867771144272`", 
          "0.2545517626449032`", "0.21419527637793534`"},
         {"0.0467661513971962`", "0.950832297214419`", "0.17005777007989265`",
           "0.3452420512096239`"},
         {"0.2491053270404584`", "0.2780433443217223`", 
          "0.21722729855827905`", "0.053890302964713976`"},
         {"0.14326649379526568`", "0.0021438328653269334`", 
          "0.4787817511934018`", "0.7104199432463698`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.09271037449676078`", "0.1237867771144272`", 
              "0.2545517626449032`", "0.21419527637793534`"},
             {"0.0467661513971962`", "0.950832297214419`", 
              "0.17005777007989265`", "0.3452420512096239`"},
             {"0.2491053270404584`", "0.2780433443217223`", 
              "0.21722729855827905`", "0.053890302964713976`"},
             {"0.14326649379526568`", "0.0021438328653269334`", 
              "0.4787817511934018`", "0.7104199432463698`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.09271037449676078`", "0.1237867771144272`", 
          "0.2545517626449032`", "0.21419527637793534`"},
         {"0.0467661513971962`", "0.950832297214419`", "0.17005777007989265`",
           "0.3452420512096239`"},
         {"0.2491053270404584`", "0.2780433443217223`", 
          "0.21722729855827905`", "0.053890302964713976`"},
         {"0.14326649379526568`", "0.0021438328653269334`", 
          "0.4787817511934018`", "0.7104199432463698`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.09271037449676078`", "0.1237867771144272`", 
              "0.2545517626449032`", "0.21419527637793534`"},
             {"0.0467661513971962`", "0.950832297214419`", 
              "0.17005777007989265`", "0.3452420512096239`"},
             {"0.2491053270404584`", "0.2780433443217223`", 
              "0.21722729855827905`", "0.053890302964713976`"},
             {"0.14326649379526568`", "0.0021438328653269334`", 
              "0.4787817511934018`", "0.7104199432463698`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.09271037449676078`", "0.1237867771144272`", 
              "0.2545517626449032`", "0.21419527637793534`"},
             {"0.0467661513971962`", "0.950832297214419`", 
              "0.17005777007989265`", "0.3452420512096239`"},
             {"0.2491053270404584`", "0.2780433443217223`", 
              "0.21722729855827905`", "0.053890302964713976`"},
             {"0.14326649379526568`", "0.0021438328653269334`", 
              "0.4787817511934018`", "0.7104199432463698`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["inv",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.09271037449676078`", "0.1237867771144272`", 
              "0.2545517626449032`", "0.21419527637793534`"},
             {"0.0467661513971962`", "0.950832297214419`", 
              "0.17005777007989265`", "0.3452420512096239`"},
             {"0.2491053270404584`", "0.2780433443217223`", 
              "0.21722729855827905`", "0.053890302964713976`"},
             {"0.14326649379526568`", "0.0021438328653269334`", 
              "0.4787817511934018`", "0.7104199432463698`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{"-", "10.755644522160997`"}], 
              RowBox[{"-", "0.4742997405332108`"}], "6.387415956458133`", 
              "2.9888472381545186`"},
             {"0.6128731600576852`", "0.9830771825395098`", 
              RowBox[{"-", "0.033060144385111734`"}], 
              RowBox[{"-", "0.6600215860507066`"}]},
             {"13.222677171077514`", 
              RowBox[{"-", "0.885432678856597`"}], 
              RowBox[{"-", "2.833122969582608`"}], 
              RowBox[{"-", "3.341500424162978`"}]},
             {
              RowBox[{"-", "6.744133516246888`"}], "0.6894129604102234`", 
              "0.6213448367401848`", "3.05884252971848`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["dot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1.`", "0", "0", "0"},
             {"0", "1.`", "0", "0"},
             {"0", "0", "1.0000000000000002`", "0"},
             {"0", "0", "0", "0.9999999999999998`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", "inv"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"\[Infinity]", "0", "0", "0"},
         {"0", "\[Infinity]", "0", "0"},
         {"0", "0", "\[Infinity]", "0"},
         {"0", "0", "0", "\[Infinity]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["det", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"ranmat", "[", "]"}], ",", "det"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.6189818705647789`", "0.4872186091087398`", 
          "0.12177364349139852`", "0.8791896897834732`"},
         {"0.36571977698197733`", "0.9061222086794849`", 
          "0.9813275564111881`", "0.1105098206889612`"},
         {"0.9965234699596563`", "0.12795541303921087`", 
          "0.5893553716818576`", "0.30007951204437777`"},
         {"0.4183179611634562`", "0.08299469237280777`", 
          "0.9797502759264369`", "0.005098496670048913`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.6189818705647789`", "0.4872186091087398`", 
              "0.12177364349139852`", "0.8791896897834732`"},
             {"0.36571977698197733`", "0.9061222086794849`", 
              "0.9813275564111881`", "0.1105098206889612`"},
             {"0.9965234699596563`", "0.12795541303921087`", 
              "0.5893553716818576`", "0.30007951204437777`"},
             {"0.4183179611634562`", "0.08299469237280777`", 
              "0.9797502759264369`", "0.005098496670048913`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["det",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.3559644208504985`", "0", "0", "0"},
             {"0", "0.3559644208504985`", "0", "0"},
             {"0", "0", "0.3559644208504985`", "0"},
             {"0", "0", "0", "0.3559644208504985`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{
        "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["tr", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"ranmat", "[", "]"}], ",", "tr"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.8990810592109981`", "0.41934777952467384`", 
          "0.056961839848106655`", "0.3242894921222301`"},
         {"0.35870965297528934`", "0.6944577981292257`", "0.669772973013979`",
           "0.30445050107196625`"},
         {"0.9644918276484007`", "0.8417021588115721`", "0.8822574003800965`",
           "0.6159861823518182`"},
         {"0.4684214991104003`", "0.8159028692337718`", 
          "0.16037954061879045`", "0.6504266870244757`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.8990810592109981`", "0.41934777952467384`", 
              "0.056961839848106655`", "0.3242894921222301`"},
             {"0.35870965297528934`", "0.6944577981292257`", 
              "0.669772973013979`", "0.30445050107196625`"},
             {"0.9644918276484007`", "0.8417021588115721`", 
              "0.8822574003800965`", "0.6159861823518182`"},
             {"0.4684214991104003`", "0.8159028692337718`", 
              "0.16037954061879045`", "0.6504266870244757`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["tr",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"3.126222944744796`", "0", "0", "0"},
             {"0", "3.126222944744796`", "0", "0"},
             {"0", "0", "3.126222944744796`", "0"},
             {"0", "0", "0", "3.126222944744796`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["T", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "T"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["Transpose",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "c", "\[ScriptCapitalA]", "\[ScriptCapitalC]"},
             {"b", "d", "\[ScriptCapitalB]", "\[ScriptCapitalD]"},
             {"\[Alpha]", "\[Gamma]", "\[DoubleStruckCapitalA]", 
              "\[DoubleStruckCapitalC]"},
             {"\[Beta]", "\[Delta]", "\[DoubleStruckCapitalB]", 
              "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["CHF", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "CHF"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["CHF",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "0", "0"},
             {"c", "d", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["ST", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "ST"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["ST",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0", "0", "\[Alpha]", "\[Beta]"},
             {"0", "0", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["dup", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"execAllTrace", "[", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"ranmat", "[", "]"}], ",", "dup", ",", "inv", ",", "dot"}], 
     "}"}]}], "]"}], "//", "FullSimplify"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0.9308456753428362`", "0.8412731993171458`", "0.4936798819342254`",
           "0.2028399226649844`"},
         {"0.1644848841167097`", "0.7371833235649197`", "0.5470656645688643`",
           "0.5749596245595741`"},
         {"0.9035080858073845`", "0.5122413239159542`", 
          "0.14534539784699652`", "0.1488014539868232`"},
         {"0.7423352582896245`", "0.02992764028842876`", 
          "0.3666289411600401`", "0.6549448375233693`"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.9308456753428362`", "0.8412731993171458`", 
              "0.4936798819342254`", "0.2028399226649844`"},
             {"0.1644848841167097`", "0.7371833235649197`", 
              "0.5470656645688643`", "0.5749596245595741`"},
             {"0.9035080858073845`", "0.5122413239159542`", 
              "0.14534539784699652`", "0.1488014539868232`"},
             {"0.7423352582896245`", "0.02992764028842876`", 
              "0.3666289411600401`", "0.6549448375233693`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["dup",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.9308456753428362`", "0.8412731993171458`", 
              "0.4936798819342254`", "0.2028399226649844`"},
             {"0.1644848841167097`", "0.7371833235649197`", 
              "0.5470656645688643`", "0.5749596245595741`"},
             {"0.9035080858073845`", "0.5122413239159542`", 
              "0.14534539784699652`", "0.1488014539868232`"},
             {"0.7423352582896245`", "0.02992764028842876`", 
              "0.3666289411600401`", "0.6549448375233693`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.9308456753428362`", "0.8412731993171458`", 
              "0.4936798819342254`", "0.2028399226649844`"},
             {"0.1644848841167097`", "0.7371833235649197`", 
              "0.5470656645688643`", "0.5749596245595741`"},
             {"0.9035080858073845`", "0.5122413239159542`", 
              "0.14534539784699652`", "0.1488014539868232`"},
             {"0.7423352582896245`", "0.02992764028842876`", 
              "0.3666289411600401`", "0.6549448375233693`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["inv",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.9308456753428362`", "0.8412731993171458`", 
              "0.4936798819342254`", "0.2028399226649844`"},
             {"0.1644848841167097`", "0.7371833235649197`", 
              "0.5470656645688643`", "0.5749596245595741`"},
             {"0.9035080858073845`", "0.5122413239159542`", 
              "0.14534539784699652`", "0.1488014539868232`"},
             {"0.7423352582896245`", "0.02992764028842876`", 
              "0.3666289411600401`", "0.6549448375233693`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"0.39120810570299286`", 
              RowBox[{"-", "0.7884191938565317`"}], "0.46495689815745067`", 
              "0.4653373869684051`"},
             {
              RowBox[{"-", "1.0982416613935746`"}], "1.323373935493504`", 
              "1.9249323704418868`", 
              RowBox[{"-", "1.2589641382696874`"}]},
             {"4.313039463323348`", 
              RowBox[{"-", "1.4427007725470178`"}], 
              RowBox[{"-", "5.070487771571817`"}], "1.0827385995708338`"},
             {
              RowBox[{"-", "2.8076026789877053`"}], "1.6407515593476154`", 
              "2.2234314964807322`", "0.45084433571836735`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["dot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1.0000000000000004`", "0", "0", "0"},
             {"0", "0.9999999999999998`", "0", "0"},
             {"0", "0", "1.`", "0"},
             {"0", "0", "0", "1.`"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["swap", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "q", ",", "swap"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"x", "y", "\[Xi]", "\[Psi]"},
         {"z", "w", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["swap",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "swap"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["swap",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "swap", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["swap",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["rot", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "q", ",", "rot"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"x", "y", "\[Xi]", "\[Psi]"},
         {"z", "w", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["rot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"x", "y", "\[Xi]", "\[Psi]"},
             {"z", "w", "\[Zeta]", "\[Omega]"},
             {"\[ScriptCapitalX]", "\[ScriptCapitalY]", 
              "\[DoubleStruckCapitalX]", "\[DoubleStruckCapitalY]"},
             {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", 
              "\[DoubleStruckCapitalZ]", "\[DoubleStruckCapitalW]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"p", ",", "rot"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["rot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "rot", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["rot",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["pop", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"gridStack", "@", 
  RowBox[{"(", 
   RowBox[{"pqstack", "/.", "popR"}], ")"}]}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"gridStack", "@", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{"pqstack", "/.", "popR"}], "/.", "popR"}], ")"}]}]], "Input"],

Cell[BoxData[
 InterpretationBox[
  TagBox[GridBox[{
     {""}
    },
    AutoDelete->False,
    GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
    GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
   "Grid"],
  Grid[{{}}, Frame -> All]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"gridStack", "@", 
  RowBox[{"(", 
   RowBox[{
    RowBox[{
     RowBox[{"pqstack", "/.", "popR"}], "/.", "popR"}], "/.", "popR"}], 
   ")"}]}]], "Input"],

Cell[BoxData[
 InterpretationBox[
  TagBox[GridBox[{
     {""}
    },
    AutoDelete->False,
    GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
    GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
   "Grid"],
  Grid[{{}}, Frame -> All]]], "Output"]
}, Open  ]]
}, Closed]],

Cell["true", "Subsubsection"],

Cell["false", "Subsubsection"],

Cell["ul", "Subsubsection"],

Cell["ur", "Subsubsection"],

Cell["ll", "Subsubsection"],

Cell["lr", "Subsubsection"],

Cell[CellGroupData[{

Cell["push", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"gridStack", "@", "pstack"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"gridStack", "@", "pqstack"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"x", "y", "\[Xi]", "\[Psi]"},
         {"z", "w", "\[Zeta]", "\[Omega]"},
         {"\[ScriptCapitalX]", "\[ScriptCapitalY]", "\[DoubleStruckCapitalX]",
           "\[DoubleStruckCapitalY]"},
         {"\[ScriptCapitalZ]", "\[ScriptCapitalW]", "\[DoubleStruckCapitalZ]",
           "\[DoubleStruckCapitalW]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Closed]],

Cell["ran", "Subsubsection"]
}, Open  ]],

Cell[CellGroupData[{

Cell["RandomString", "Subsection"],

Cell[CellGroupData[{

Cell["Frequentized instructions", "Subsubsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"instructionFrequencies", ",", "frequentizedInstructions"}], "]"}],
   ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData["instructionSet"], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "nop", ",", "conj2", ",", "conj2I", ",", "plus", ",", "dot", ",", "minus", 
   ",", "div", ",", "conj", ",", "conjI", ",", "comm", ",", "commI", ",", 
   "uminus", ",", "inv", ",", "det", ",", "tr", ",", "Transpose", ",", "CHF", 
   ",", "ST", ",", "dup", ",", "swap", ",", "rot", ",", "pop", ",", "true", 
   ",", "false", ",", "ul", ",", "ur", ",", "ll", ",", "lr"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{"frequentizedInstructions", "=", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "nop"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "conj2"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "conj2I"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "plus"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "dot"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "minus"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "div"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "conj"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "conjI"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "comm"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "commI"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "uminus"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "10"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "inv"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "det"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "tr"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "5"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "Transpose"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "CHF"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "ST"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "dup"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "swap"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "rot"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "10"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "pop"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "10"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "true"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "false"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "ul"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "ur"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "ll"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<outcome\>\"", "\[Rule]", "lr"}], ",", 
        RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}]}], "}"}]}], 
   ")"}], "//", "M"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "nop"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "conj2"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "conj2I"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "plus"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "dot"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "minus"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "div"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "conj"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "conjI"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "comm"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "commI"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "uminus"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "10"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "inv"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "det"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "tr"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "5"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "Transpose"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "CHF"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "ST"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "dup"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "swap"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "rot"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "10"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "pop"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "10"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "true"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "false"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "ul"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "ur"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "ll"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "lr"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "100"}]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Method of aliases", "Subsubsection"],

Cell["\<\
Walker's method of aliases for generating non-uniform random deviates.\
\>", "Text"],

Cell["\<\
Consider a list of pairs, each representing an outcome and a relative \
(non-normalized) probability or frequency count.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"redistributeFrequenciesHelper", ",", "redistributeFrequencies"}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"redistributeFrequencies", "[", "pairs_", "]"}], ":=", 
   "\[IndentingNewLine]", 
   RowBox[{"With", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"n", "=", 
        RowBox[{"Length", "@", "pairs"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"s", "=", 
        RowBox[{"Plus", "@@", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\"\<frequency\>\"", "/.", "#"}], ")"}], "&"}], "/@", 
           "pairs"}], ")"}]}]}]}], "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"With", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"d", "=", 
         RowBox[{"LCM", "[", 
          RowBox[{"n", ",", "s"}], "]"}]}], "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"dOverN", "=", 
            RowBox[{"d", "/", "n"}]}], ",", 
           RowBox[{"dOverS", "=", 
            RowBox[{"d", "/", "s"}]}]}], "}"}], ",", "\[IndentingNewLine]", 
         RowBox[{"redistributeFrequenciesHelper", "[", 
          RowBox[{"dOverN", ",", 
           RowBox[{"{", "}"}], ",", 
           RowBox[{
            RowBox[{
             RowBox[{"{", "\[IndentingNewLine]", 
              RowBox[{
               RowBox[{"\"\<outcome\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"\"\<outcome\>\"", "/.", "#"}], ")"}]}], ",", 
               "\[IndentingNewLine]", 
               RowBox[{"\"\<frequency\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"(", 
                   RowBox[{"\"\<frequency\>\"", "/.", "#"}], ")"}], "*", 
                  "dOverS"}], ")"}]}]}], "}"}], "&"}], "/@", "pairs"}]}], 
          "]"}]}], "\[IndentingNewLine]", "]"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"redistributeFrequenciesHelper", "[", 
    RowBox[{"targetCount_", ",", "redistributed_", ",", 
     RowBox[{"{", "pair_", "}"}]}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"targetCount", "=!=", 
      RowBox[{"(", 
       RowBox[{"\"\<frequency\>\"", "/.", "pair"}], ")"}]}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Throw", "[", 
      RowBox[{"{", 
       RowBox[{
       "\"\<fatal error\>\"", ",", "targetCount", ",", "redistributed", ",", 
        "pair"}], "}"}], "]"}], ",", "\[IndentingNewLine]", 
     RowBox[{"With", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"trialOutput", "=", 
         RowBox[{"Append", "[", 
          RowBox[{"redistributed", ",", "\[IndentingNewLine]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"\"\<outcome\>\"", "\[Rule]", 
              RowBox[{"(", 
               RowBox[{"\"\<outcome\>\"", "/.", "pair"}], ")"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"\"\<foreignOutcome\>\"", "\[Rule]", "Null"}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"\"\<frequency\>\"", "\[Rule]", 
              RowBox[{"(", 
               RowBox[{"\"\<frequency\>\"", "/.", "pair"}], ")"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"\"\<foreignFrequency\>\"", "\[Rule]", "0"}]}], "}"}]}], 
          "]"}]}], "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{"With", "[", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"checks", "=", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{
               RowBox[{"(", 
                RowBox[{"\"\<frequency\>\"", "/.", "#"}], ")"}], "+", 
               RowBox[{"(", 
                RowBox[{"\"\<foreignFrequency\>\"", "/.", "#"}], ")"}]}], 
              ")"}], "&"}], "/@", "trialOutput"}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"Not", "[", 
            RowBox[{"And", "@@", 
             RowBox[{"(", 
              RowBox[{
               RowBox[{
                RowBox[{"targetCount", "===", "#"}], "&"}], "/@", "checks"}], 
              ")"}]}], "]"}], ",", "\[IndentingNewLine]", 
           RowBox[{"Throw", "[", 
            RowBox[{"{", 
             RowBox[{
             "\"\<invariant check failed\>\"", ",", "checks", ",", 
              "targetCount"}], "}"}], "]"}], ",", "\[IndentingNewLine]", 
           "trialOutput"}], "]"}]}], "\[IndentingNewLine]", "]"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"redistributeFrequenciesHelper", "[", 
    RowBox[{"targetCount_", ",", "redistributed_", ",", 
     RowBox[{"{", "pairs__", "}"}]}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"With", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"sorted", "=", 
       RowBox[{"SortBy", "[", 
        RowBox[{
         RowBox[{"{", "pairs", "}"}], ",", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"\"\<frequency\>\"", "/.", "#"}], ")"}], "&"}]}], "]"}]}], 
      "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"With", "[", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"lowest", "=", 
          RowBox[{"First", "@", "sorted"}]}], ",", "\[IndentingNewLine]", 
         RowBox[{"highest", "=", 
          RowBox[{"Last", "@", "sorted"}]}], ",", "\[IndentingNewLine]", 
         RowBox[{"newPairs", "=", 
          RowBox[{"Drop", "[", 
           RowBox[{
            RowBox[{"Drop", "[", 
             RowBox[{"sorted", ",", "1"}], "]"}], ",", 
            RowBox[{"-", "1"}]}], "]"}]}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"With", "[", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"locount", "=", 
            RowBox[{"(", 
             RowBox[{"\"\<frequency\>\"", "/.", "lowest"}], ")"}]}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"hicount", "=", 
            RowBox[{"(", 
             RowBox[{"\"\<frequency\>\"", "/.", "highest"}], ")"}]}]}], "}"}],
          ",", "\[IndentingNewLine]", 
         RowBox[{"redistributeFrequenciesHelper", "[", "\[IndentingNewLine]", 
          RowBox[{"targetCount", ",", "\[IndentingNewLine]", 
           RowBox[{"Append", "[", "\[IndentingNewLine]", 
            RowBox[{"redistributed", ",", "\[IndentingNewLine]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"\"\<outcome\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"\"\<outcome\>\"", "/.", "lowest"}], ")"}]}], ",", 
               "\[IndentingNewLine]", 
               RowBox[{"\"\<foreignOutcome\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"\"\<outcome\>\"", "/.", "highest"}], ")"}]}], ",", 
               "\[IndentingNewLine]", 
               RowBox[{"\"\<frequency\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"\"\<frequency\>\"", "/.", "lowest"}], ")"}]}], ",", 
               "\[IndentingNewLine]", 
               RowBox[{"\"\<foreignFrequency\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"targetCount", "-", "locount"}], ")"}]}]}], 
              "\[IndentingNewLine]", "}"}]}], "]"}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"Prepend", "[", "\[IndentingNewLine]", 
            RowBox[{"newPairs", ",", "\[IndentingNewLine]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"\"\<outcome\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"\"\<outcome\>\"", "/.", "highest"}], ")"}]}], ",", 
               "\[IndentingNewLine]", 
               RowBox[{"\"\<frequency\>\"", "\[Rule]", 
                RowBox[{"(", 
                 RowBox[{"hicount", "-", 
                  RowBox[{"(", 
                   RowBox[{"targetCount", "-", "locount"}], ")"}]}], 
                 ")"}]}]}], "\[IndentingNewLine]", "}"}]}], "]"}]}], "]"}]}], 
        "]"}]}], "]"}]}], "]"}]}], ";"}]}], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"nonUniformRandomChoice", ",", "nonUniformRandomSample"}], "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"nonUniformRandomChoice", "[", 
    RowBox[{"len_", ",", "height_", ",", "redistributed_"}], "]"}], ":=", 
   "\[IndentingNewLine]", 
   RowBox[{"With", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"cell", "=", 
        RowBox[{"redistributed", "\[LeftDoubleBracket]", 
         RowBox[{"RandomInteger", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "len"}], "}"}], "]"}], 
         "\[RightDoubleBracket]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"water", "=", 
        RowBox[{"RandomInteger", "[", 
         RowBox[{"{", 
          RowBox[{"1", ",", "height"}], "}"}], "]"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"water", ">", 
         RowBox[{"(", 
          RowBox[{"\"\<frequency\>\"", "/.", "cell"}], ")"}]}], ",", 
        "\[IndentingNewLine]", "\"\<foreignOutcome\>\"", ",", 
        "\[IndentingNewLine]", "\"\<outcome\>\""}], "]"}], "/.", "cell"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"nonUniformRandomSample", "[", 
    RowBox[{"len_", ",", "height_", ",", "redistributed_", ",", 
     RowBox[{"{", "n_", "}"}]}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"nonUniformRandomChoice", "[", 
      RowBox[{"len", ",", "height", ",", "redistributed"}], "]"}], ",", 
     RowBox[{"{", "n", "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"nonUniformRandomSample", "[", 
    RowBox[{"redistributed_", ",", 
     RowBox[{"{", "n_", "}"}]}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"With", "[", "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"len", "=", 
        RowBox[{"Length", "@", "redistributed"}]}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"height", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"\"\<frequency\>\"", "/.", 
           RowBox[{"(", 
            RowBox[{"First", "@", "redistributed"}], ")"}]}], ")"}], "+", 
         RowBox[{"(", 
          RowBox[{"\"\<foreignFrequency\>\"", "/.", 
           RowBox[{"(", 
            RowBox[{"First", "@", "redistributed"}], ")"}]}], ")"}]}]}]}], 
      "}"}], ",", "\[IndentingNewLine]", 
     RowBox[{"nonUniformRandomSample", "[", 
      RowBox[{"len", ",", "height", ",", "redistributed", ",", 
       RowBox[{"{", "n", "}"}]}], "]"}]}], "]"}]}], ";"}]}], "Input"],

Cell["Unit Test", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(", 
   RowBox[{"loadedDie", "=", 
    RowBox[{"redistributeFrequencies", "[", "\[IndentingNewLine]", 
     RowBox[{"loadedDieSpecification", "=", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<outcome\>\"", "\[Rule]", "\"\<A\>\""}], ",", 
          RowBox[{"\"\<frequency\>\"", "\[Rule]", "7"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<outcome\>\"", "\[Rule]", "\"\<B\>\""}], ",", 
          RowBox[{"\"\<frequency\>\"", "\[Rule]", "5"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<outcome\>\"", "\[Rule]", "\"\<C\>\""}], ",", 
          RowBox[{"\"\<frequency\>\"", "\[Rule]", "0"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<outcome\>\"", "\[Rule]", "\"\<D\>\""}], ",", 
          RowBox[{"\"\<frequency\>\"", "\[Rule]", "11"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<outcome\>\"", "\[Rule]", "\"\<E\>\""}], ",", 
          RowBox[{"\"\<frequency\>\"", "\[Rule]", "3"}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"\"\<outcome\>\"", "\[Rule]", "\"\<F\>\""}], ",", 
          RowBox[{"\"\<frequency\>\"", "\[Rule]", "13"}]}], "}"}]}], "}"}]}], 
     "]"}]}], ")"}], "//", "M"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "\<\"C\"\>"}], 
      RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "\<\"F\"\>"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], 
      RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "13"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "\<\"E\"\>"}], 
      RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "\<\"D\"\>"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "6"}], 
      RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "7"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "\<\"B\"\>"}], 
      RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "\<\"D\"\>"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "10"}], 
      RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "3"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "\<\"D\"\>"}], 
      RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "\<\"A\"\>"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "12"}], 
      RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "\<\"A\"\>"}], 
      RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "\<\"F\"\>"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "13"}], 
      RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "0"}]},
     {
      RowBox[{"\<\"outcome\"\>", "\[Rule]", "\<\"F\"\>"}], 
      RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "Null"}], 
      RowBox[{"\<\"frequency\"\>", "\[Rule]", "13"}], 
      RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "0"}]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BarChart", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"(", 
      RowBox[{"\"\<frequency\>\"", "/.", "#"}], ")"}], "&"}], "/@", 
    "loadedDieSpecification"}], ",", 
   RowBox[{"ChartLabels", "\[Rule]", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{
       RowBox[{"(", 
        RowBox[{"\"\<outcome\>\"", "/.", "#"}], ")"}], "&"}], "/@", 
      "loadedDieSpecification"}], ")"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{
   {Opacity[0], PointBox[{{0.44545454545454544`, 0.}}]}, {{}, 
    {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
     EdgeForm[{Opacity[0.7], Thickness[Small]}], 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{0.5454545454545454, 0.}, {1.4545454545454546`, 7.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{23.483966392911185`, 
           88.16775178301278}, {-18.95405779783397, 122.58269163714203`}}],
         StatusArea[#, 7]& ,
         TagBoxNote->"7"],
        StyleBox["7", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[7, {
          GrayLevel[0]}], "Tooltip"]& ]}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{1.5454545454545454`, 0.}, {2.4545454545454546`, 5.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{93.94863032202292, 158.63241571212453`}, {
           21.306442040730616`, 122.58269163714203`}}],
         StatusArea[#, 5]& ,
         TagBoxNote->"5"],
        StyleBox["5", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[5, {
          GrayLevel[0]}], "Tooltip"]& ]}, {}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{3.5454545454545454`, 0.}, {4.454545454545454, 11.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{234.87795818024642`, 
           299.561743570348}, {-99.47505747496311, 122.58269163714203`}}],
         StatusArea[#, 11]& ,
         TagBoxNote->"11"],
        StyleBox["11", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[11, {
          GrayLevel[0]}], "Tooltip"]& ]}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{4.545454545454545, 0.}, {5.454545454545454, 3.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{305.34262210935816`, 370.02640749945976`}, {
           61.56694187929518, 122.58269163714203`}}],
         StatusArea[#, 3]& ,
         TagBoxNote->"3"],
        StyleBox["3", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[3, {
          GrayLevel[0]}], "Tooltip"]& ]}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{5.545454545454545, 0.}, {6.454545454545454, 13.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{375.80728603846995`, 
           440.4910714285715}, {-139.7355573135277, 122.58269163714203`}}],
         StatusArea[#, 13]& ,
         TagBoxNote->"13"],
        StyleBox["13", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[13, {
          GrayLevel[0]}], "Tooltip"]& ]}}, {}, {}}, {}, {}, GraphicsGroupBox[
    {GrayLevel[0], 
     StyleBox[
      StyleBox[
       StyleBox[{
         {Thickness[Tiny], 
          LineBox[{{0.44545454545454544`, 0.}, {6.454545454545453, 0.}}]}, 
         {Thickness[Tiny], 
          LineBox[{{0.5454545454545454, 0.}, 
            Offset[{-1.102182119232618*^-15, -6.}, {0.5454545454545454, 
             0.}]}], LineBox[{{6.454545454545453, 0.}, 
            Offset[{-1.102182119232618*^-15, -6.}, {6.454545454545453, 
             0.}]}], {{}, {}, {}, {}, {}, {}, {
            LineBox[{{1.4545454545454546`, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {1.4545454545454546`, 
               0.}]}], 
            LineBox[{{1.5454545454545454`, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {1.5454545454545454`, 
               0.}]}], 
            LineBox[{{2.4545454545454546`, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {2.4545454545454546`, 
               0.}]}], 
            LineBox[{{2.5454545454545454`, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {2.5454545454545454`, 
               0.}]}], 
            LineBox[{{3.4545454545454546`, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {3.4545454545454546`, 
               0.}]}], 
            LineBox[{{3.5454545454545454`, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {3.5454545454545454`, 
               0.}]}], 
            LineBox[{{4.454545454545454, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {4.454545454545454, 
               0.}]}], 
            LineBox[{{4.545454545454545, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {4.545454545454545, 
               0.}]}], 
            LineBox[{{5.454545454545453, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {5.454545454545453, 
               0.}]}], 
            LineBox[{{5.545454545454545, 0.}, 
              Offset[{-7.347880794884119*^-16, -4.}, {5.545454545454545, 
               0.}]}]}, {}}, {
           InsetBox["\<\"A\"\>", Offset[{0., -2.}, {1., 0.}], {0, 1}, 
            Automatic, {1, 0}], 
           InsetBox["\<\"B\"\>", Offset[{0., -2.}, {2., 0.}], {0, 1}, 
            Automatic, {1, 0}], 
           InsetBox["\<\"C\"\>", Offset[{0., -2.}, {3., 0.}], {0, 1}, 
            Automatic, {1, 0}], 
           InsetBox["\<\"D\"\>", 
            Offset[{0., -2.}, {3.9999999999999996`, 0.}], {0, 1}, Automatic, {
            1, 0}], InsetBox["\<\"E\"\>", Offset[{0., -2.}, {5., 0.}], {0, 1},
             Automatic, {1, 0}], 
           InsetBox["\<\"F\"\>", Offset[{0., -2.}, {5.999999999999998, 0.}], {0, 1},
             Automatic, {1, 0}]}}},
        Antialiasing->False], "GraphicsAxes",
       StripOnInput->False],
      Antialiasing->False]}]},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{False, True},
  AxesLabel->{None, None},
  AxesOrigin->{0.44545454545454544`, 0},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  PlotRangePadding->Scaled[0.02],
  Ticks->{None, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"testTally", "=", 
  RowBox[{
   RowBox[{
    RowBox[{"Tally", "[", 
     RowBox[{"nonUniformRandomSample", "[", 
      RowBox[{"loadedDie", ",", 
       RowBox[{"{", "100000", "}"}]}], "]"}], "]"}], "~", "Join", "~", 
    RowBox[{"{", 
     RowBox[{"{", 
      RowBox[{"\"\<C\>\"", ",", "0"}], "}"}], "}"}]}], "//", 
   RowBox[{
    RowBox[{"SortBy", "[", 
     RowBox[{"#", ",", 
      RowBox[{
       RowBox[{"#", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
       "&"}]}], "]"}], "&"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"\<\"A\"\>", ",", "17874"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"B\"\>", ",", "12867"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"C\"\>", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"D\"\>", ",", "28223"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"E\"\>", ",", "7640"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"F\"\>", ",", "33396"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell["\<\
Formally checking the results would require a chi-squared test. Just go for \
\"eyeballing\" here:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"BarChart", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"#", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
     "&"}], "/@", "testTally"}], ",", 
   RowBox[{
    RowBox[{
     RowBox[{"ChartLabels", "\[Rule]", 
      RowBox[{"#", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}]}], 
     "&"}], "/@", "testTally"}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{
   {Opacity[0], PointBox[{{0.44545454545454544`, 0.}}]}, {{}, 
    {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
     EdgeForm[{Opacity[0.7], Thickness[Small]}], 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{0.5454545454545454, 0.}, {1.4545454545454546`, 
            17874.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{43.15792977554107, 
           104.87774591682361`}, {-13.984231841214111`, 120.22201186214416`}}],
         StatusArea[#, 17874]& ,
         TagBoxNote->"17874"],
        StyleBox["17874", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[17874, {
          GrayLevel[0]}], "Tooltip"]& ]}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{1.5454545454545454`, 0.}, {2.4545454545454546`, 
            12867.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{110.36222753095187`, 172.08204367223442`}, {
           23.43555596357021, 120.22201186214416`}}],
         StatusArea[#, 12867]& ,
         TagBoxNote->"12867"],
        StyleBox["12867", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[12867, {
          GrayLevel[0]}], "Tooltip"]& ]}, {}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{3.5454545454545454`, 0.}, {4.454545454545454, 
            28223.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{244.77082304177344`, 
           306.490639183056}, {-91.32742816470379, 120.22201186214416`}}],
         StatusArea[#, 28223]& ,
         TagBoxNote->"28223"],
        StyleBox["28223", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[28223, {
          GrayLevel[0]}], "Tooltip"]& ]}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{4.545454545454545, 0.}, {5.454545454545454, 7640.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{311.9751207971842, 373.69493693846675`}, {
           62.499512595407154`, 120.22201186214416`}}],
         StatusArea[#, 7640]& ,
         TagBoxNote->"7640"],
        StyleBox["7640", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[7640, {
          GrayLevel[0]}], "Tooltip"]& ]}, 
     {RGBColor[0.798413061722744, 0.824719615472648, 0.968322270542458], 
      EdgeForm[{Opacity[0.7], Thickness[Small]}], 
      TagBox[
       TooltipBox[
        TagBox[
         DynamicBox[{
           FEPrivate`If[
            CurrentValue["MouseOver"], 
            EdgeForm[{
              GrayLevel[0.5], 
              AbsoluteThickness[1.5], 
              Opacity[0.66]}], {}, {}], 
           
           RectangleBox[{5.545454545454545, 0.}, {6.454545454545454, 33396.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{379.179418552595, 
           440.89923469387753`}, {-129.98781608444602`, 120.22201186214414`}}],
         StatusArea[#, 33396]& ,
         TagBoxNote->"33396"],
        StyleBox["33396", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[33396, {
          GrayLevel[0]}], "Tooltip"]& ]}}, {}, {}}, {}, {}, GraphicsGroupBox[
    {GrayLevel[0], 
     StyleBox[
      StyleBox[
       StyleBox[{
         {Thickness[Tiny], 
          LineBox[{{0.44545454545454544`, 0.}, {6.454545454545453, 0.}}]}, 
         {Thickness[Tiny], 
          LineBox[{{0.5454545454545454, 0.}, 
            Offset[{-1.102182119232618*^-15, -6.}, {0.5454545454545454, 
             0.}]}], LineBox[{{6.454545454545453, 0.}, 
            Offset[{-1.102182119232618*^-15, -6.}, {6.454545454545453, 
             0.}]}], {{}, {}, {}, {}, {}, {}, {}, {}}, {}}},
        Antialiasing->False], "GraphicsAxes",
       StripOnInput->False],
      Antialiasing->False]}]},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{False, True},
  AxesLabel->{None, None},
  AxesOrigin->{0.44545454545454544`, 0},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  PlotRangePadding->Scaled[0.02],
  Ticks->{None, Automatic}]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Frequentized Random Instruction Strings", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"redistributedInstructions", "=", 
  RowBox[{
  "redistributeFrequencies", "[", "frequentizedInstructions", 
   "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "commI"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "ur"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "conj2I"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "ul"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "conjI"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "true"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "det"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "Transpose"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "div"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "swap"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "inv"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "ST"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "nop"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "plus"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "0"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1735"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "tr"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "minus"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "140"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1595"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "pop"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "lr"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "280"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1455"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "rot"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "ll"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "280"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1455"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "uminus"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "false"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "280"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "1455"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "plus"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "dup"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "ST"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "dot"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "swap"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "conj2"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "Transpose"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "conj"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "true"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "comm"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "ul"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "CHF"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "ur"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "dup"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1065"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "670"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "minus"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "dot"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1205"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "530"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "false"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "conj2"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1345"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "390"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "ll"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "conj"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1345"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "390"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "lr"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "comm"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1345"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "390"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "dup"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "CHF"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1460"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "275"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "dot"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "CHF"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1600"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "135"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "CHF"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "conj2"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1720"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "15"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "conj2"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "conj"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1725"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "10"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "conj"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "comm"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1730"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "5"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"\<\"outcome\"\>", "\[Rule]", "comm"}], ",", 
     RowBox[{"\<\"foreignOutcome\"\>", "\[Rule]", "Null"}], ",", 
     RowBox[{"\<\"frequency\"\>", "\[Rule]", "1735"}], ",", 
     RowBox[{"\<\"foreignFrequency\"\>", "\[Rule]", "0"}]}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"nRedistributedInstructions", "=", 
  RowBox[{"Length", "@", "redistributedInstructions"}]}]], "Input"],

Cell[BoxData["28"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"heightRedistributedInstructions", "=", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\"\<frequency\>\"", "/.", 
     RowBox[{"(", 
      RowBox[{"First", "@", "redistributedInstructions"}], ")"}]}], ")"}], 
   "+", "\[IndentingNewLine]", 
   RowBox[{"(", 
    RowBox[{"\"\<foreignFrequency\>\"", "/.", 
     RowBox[{"(", 
      RowBox[{"First", "@", "redistributedInstructions"}], ")"}]}], 
    ")"}]}]}]], "Input"],

Cell[BoxData["1735"], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "randomInstructionString", "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"randomInstructionString", "[", 
   RowBox[{"n_:", "100"}], "]"}], ":=", 
  RowBox[{"nonUniformRandomSample", "[", "\[IndentingNewLine]", 
   RowBox[{
   "nRedistributedInstructions", ",", "\[IndentingNewLine]", 
    "heightRedistributedInstructions", ",", "\[IndentingNewLine]", 
    "redistributedInstructions", ",", "\[IndentingNewLine]", 
    RowBox[{"{", "n", "}"}]}], "]"}]}]}], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "pretty", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"pretty", "=", 
   RowBox[{
    RowBox[{"Grid", "[", 
     RowBox[{"T", "@", 
      RowBox[{"{", 
       RowBox[{"gridStack", "/@", "#"}], "}"}]}], "]"}], "&"}]}], 
  ";"}]}], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Frequentized Random Instruction Combinations\
\>", "Subsubsection"],

Cell["\<\
Some random instruction strings generate VERY lengthy computations, much more \
than we want to tolerate. Some of these lengthy computations are due to \
symbolic inverses and determinants. We should not generate such things. Some \
of them are due to symbolic conjugate and commutator combinations. In \
reality, we only want conjugates and commutators for the primitive matrices \
with symbolic inputs. Therefore, we will restrict the searches to generating \
relevant instruction combinations. \
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"ul", ",", "p", ",", "swap", ",", "comm"}], "}"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     InterpretationBox[
      TagBox[GridBox[{
         {""}
        },
        AutoDelete->False,
        GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
        GridBoxItemSize->{
         "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
       "Grid"],
      Grid[{{}}, Frame -> All]]},
    {
     TagBox["ul",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"a", "b", "\[Alpha]", "\[Beta]"},
         {"c", "d", "\[Gamma]", "\[Delta]"},
         {"\[ScriptCapitalA]", "\[ScriptCapitalB]", "\[DoubleStruckCapitalA]",
           "\[DoubleStruckCapitalB]"},
         {"\[ScriptCapitalC]", "\[ScriptCapitalD]", "\[DoubleStruckCapitalC]",
           "\[DoubleStruckCapitalD]"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["swap",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"a", "b", "\[Alpha]", "\[Beta]"},
             {"c", "d", "\[Gamma]", "\[Delta]"},
             {"\[ScriptCapitalA]", "\[ScriptCapitalB]", 
              "\[DoubleStruckCapitalA]", "\[DoubleStruckCapitalB]"},
             {"\[ScriptCapitalC]", "\[ScriptCapitalD]", 
              "\[DoubleStruckCapitalC]", "\[DoubleStruckCapitalD]"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]], 
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {"1", "0", "0", "0"},
             {"0", "1", "0", "0"},
             {"0", "0", "0", "0"},
             {"0", "0", "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]},
    {
     TagBox["comm",
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[GridBox[{
        {
         TagBox[
          RowBox[{"(", "\[NoBreak]", GridBox[{
             {
              RowBox[{
               SuperscriptBox["a", "2"], "+", 
               SuperscriptBox["b", "2"]}], 
              RowBox[{
               RowBox[{"a", " ", "c"}], "+", 
               RowBox[{"b", " ", "d"}]}], "0", "0"},
             {
              RowBox[{
               RowBox[{"a", " ", "c"}], "+", 
               RowBox[{"b", " ", "d"}]}], 
              RowBox[{
               SuperscriptBox["c", "2"], "+", 
               SuperscriptBox["d", "2"]}], "0", "0"},
             {
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalB]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalA]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalB]"}]}], "0", "0"},
             {
              RowBox[{
               RowBox[{"a", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"b", " ", "\[ScriptCapitalD]"}]}], 
              RowBox[{
               RowBox[{"c", " ", "\[ScriptCapitalC]"}], "+", 
               RowBox[{"d", " ", "\[ScriptCapitalD]"}]}], "0", "0"}
            },
            
            GridBoxAlignment->{
             "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
              "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
            GridBoxSpacings->{"Columns" -> {
                Offset[0.27999999999999997`], {
                 Offset[0.7]}, 
                Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
                Offset[0.2], {
                 Offset[0.4]}, 
                Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
          Function[BoxForm`e$, 
           MatrixForm[BoxForm`e$]]]}
       },
       AutoDelete->False,
       GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
       GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
      "Grid"]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "frequentizedInstructionCombinations", "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"(", 
    RowBox[{"frequentizedInstructionCombinations", "=", 
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ul", ",", "swap", ",", "conj"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ur", ",", "swap", ",", "conj"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ll", ",", "swap", ",", "conj"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"lr", ",", "swap", ",", "conj"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ul", ",", "swap", ",", "comm"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ur", ",", "swap", ",", "comm"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ll", ",", "swap", ",", "comm"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"lr", ",", "swap", ",", "comm"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "25"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ul", ",", "swap", ",", "lr", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ul", ",", "swap", ",", "ll", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ul", ",", "swap", ",", "ur", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ur", ",", "swap", ",", "lr", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ur", ",", "swap", ",", "ll", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ur", ",", "swap", ",", "ul", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"lr", ",", "swap", ",", "ur", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"lr", ",", "swap", ",", "ll", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"lr", ",", "swap", ",", "ul", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ll", ",", "swap", ",", "ur", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ll", ",", "swap", ",", "lr", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"ll", ",", "swap", ",", "ul", ",", "conj2"}], "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "8"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "plus", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "dot", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "minus", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "uminus", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "10"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "tr", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "T", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "CHF", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "ST", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "dup", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "swap", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "rot", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "pop", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "true", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "false", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "ul", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "ur", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "ll", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"\"\<outcome\>\"", "\[Rule]", 
          RowBox[{"{", "lr", "}"}]}], ",", 
         RowBox[{"\"\<frequency\>\"", "\[Rule]", "100"}]}], "}"}]}], "}"}]}], 
    ")"}], "//", "M"}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"redistributedInstructionCombinations", "=", 
   RowBox[{
   "redistributeFrequencies", "@", "frequentizedInstructionCombinations"}]}], 
  ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"nRedistributedInstructionCombinations", "=", 
  RowBox[{"Length", "@", "redistributedInstructionCombinations"}]}]], "Input"],

Cell[BoxData["38"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"heightRedistributedInstructionCombinations", "=", 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{"\"\<frequency\>\"", "/.", 
     RowBox[{"(", 
      RowBox[{"First", "@", "redistributedInstructionCombinations"}], ")"}]}],
     ")"}], "+", "\[IndentingNewLine]", 
   RowBox[{"(", 
    RowBox[{"\"\<foreignFrequency\>\"", "/.", 
     RowBox[{"(", 
      RowBox[{"First", "@", "redistributedInstructionCombinations"}], ")"}]}],
     ")"}]}]}]], "Input"],

Cell[BoxData["1003"], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "randomInstructionCombinationString", "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"randomInstructionCombinationString", "[", 
   RowBox[{"n_:", "100"}], "]"}], ":=", 
  RowBox[{"nonUniformRandomSample", "[", "\[IndentingNewLine]", 
   RowBox[{
   "nRedistributedInstructionCombinations", ",", "\[IndentingNewLine]", 
    "heightRedistributedInstructionCombinations", ",", "\[IndentingNewLine]", 
    "redistributedInstructionCombinations", ",", "\[IndentingNewLine]", 
    RowBox[{"{", "n", "}"}]}], "]"}]}]}], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "pretty", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"pretty", "=", 
   RowBox[{
    RowBox[{"Grid", "[", 
     RowBox[{"T", "@", 
      RowBox[{"{", 
       RowBox[{"gridStack", "/@", "#"}], "}"}]}], "]"}], "&"}]}], 
  ";"}]}], "Input"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Monte-Carlo Search", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"caught", "=", 
   RowBox[{"{", "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"lastgood", "=", 
   RowBox[{"commonbad", "=", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"{", "falseMatrix", "}"}], ",", 
      RowBox[{"{", "4", "}"}]}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"count", "=", "0"}], ";", 
  RowBox[{"score", "=", "0"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"bin", "[", "bool_", "]"}], ":=", 
   RowBox[{"If", "[", 
    RowBox[{"bool", ",", "1", ",", "0"}], "]"}]}], ";", 
  RowBox[{"maxscore", "=", "0"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"currentstring", "=", 
   RowBox[{"{", "}"}]}], ";", 
  RowBox[{"scorevec", "=", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"trial", "[", "]"}], ":=", "\[IndentingNewLine]", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"rc", "=", "2000"}], ",", 
      RowBox[{"ln", "=", "100"}]}], "}"}], ",", "\[IndentingNewLine]", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"$RecursionLimit", "=", "rc"}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"With", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"g", "=", 
          RowBox[{"Join", "@@", 
           RowBox[{"randomInstructionCombinationString", "[", "ln", "]"}]}]}],
          "}"}], ",", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"currentstring", "=", "g"}], ";", "\[IndentingNewLine]", 
         RowBox[{"With", "[", 
          RowBox[{
           RowBox[{"{", "\[IndentingNewLine]", 
            RowBox[{
             RowBox[{"tt", "=", 
              RowBox[{"execAllRaw", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"p", ",", "q"}], "}"}], ",", "g"}], "]"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"tf", "=", 
              RowBox[{"execAllRaw", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"p", ",", "aq"}], "}"}], ",", "g"}], "]"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"ft", "=", 
              RowBox[{"execAllRaw", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"ap", ",", "q"}], "}"}], ",", "g"}], "]"}]}], ",", 
             "\[IndentingNewLine]", 
             RowBox[{"ff", "=", 
              RowBox[{"execAllRaw", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"ap", ",", "aq"}], "}"}], ",", "g"}], "]"}]}]}], 
            "}"}], ",", "\[IndentingNewLine]", 
           RowBox[{"With", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"result", "=", 
               RowBox[{"{", 
                RowBox[{"tt", ",", "tf", ",", "ft", ",", "ff"}], "}"}]}], 
              "}"}], ",", "\[IndentingNewLine]", 
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{
                 RowBox[{"Length", "@", "tt"}], ">", "0"}], "&&", 
                RowBox[{
                 RowBox[{"Length", "@", "tf"}], ">", "0"}], "&&", 
                RowBox[{
                 RowBox[{"Length", "@", "ft"}], ">", "0"}], "&&", 
                RowBox[{
                 RowBox[{"Length", "@", "ff"}], ">", "0"}]}], ",", 
               "\[IndentingNewLine]", 
               RowBox[{
                RowBox[{"score", "=", "0"}], ";", "\[IndentingNewLine]", 
                RowBox[{"score", "+=", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "scorevec", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "=", 
                   RowBox[{"bin", "[", 
                    RowBox[{"falsey", "[", 
                    RowBox[{
                    "tt", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "]"}]}], ")"}]}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"score", "+=", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "scorevec", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}], "=", 
                   RowBox[{"bin", "[", 
                    RowBox[{"truthy", "[", 
                    RowBox[{
                    "tf", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "]"}]}], ")"}]}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"score", "+=", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "scorevec", "\[LeftDoubleBracket]", "3", 
                    "\[RightDoubleBracket]"}], "=", 
                   RowBox[{"bin", "[", 
                    RowBox[{"truthy", "[", 
                    RowBox[{
                    "ft", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "]"}]}], ")"}]}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"score", "+=", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{
                   "scorevec", "\[LeftDoubleBracket]", "4", 
                    "\[RightDoubleBracket]"}], "=", 
                   RowBox[{"bin", "[", 
                    RowBox[{"truthy", "[", 
                    RowBox[{
                    "ff", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "]"}]}], ")"}]}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"maxscore", "=", 
                 RowBox[{"Max", "[", 
                  RowBox[{"score", ",", "maxscore"}], "]"}]}], ";", 
                "\[IndentingNewLine]", 
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"falsey", "[", 
                    RowBox[{
                    "tt", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "&&", 
                   RowBox[{"truthy", "[", 
                    RowBox[{
                    "tf", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "&&", 
                   RowBox[{"truthy", "[", 
                    RowBox[{
                    "ft", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], "&&", 
                   RowBox[{"truthy", "[", 
                    RowBox[{
                    "ff", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}]}], ",", 
                  "\[IndentingNewLine]", 
                  RowBox[{"AppendTo", "[", 
                   RowBox[{"caught", ",", 
                    RowBox[{"{", 
                    RowBox[{"g", ",", "result"}], "}"}]}], "]"}]}], "]"}], 
                ";", "\[IndentingNewLine]", 
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{
                    "#", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "}"}], "&"}], "/@", "result"}],
                    "=!=", "commonbad"}], ",", "\[IndentingNewLine]", 
                  RowBox[{"pretty", "[", 
                   RowBox[{"lastgood", "=", "result"}], "]"}], ",", 
                  "\[IndentingNewLine]", 
                  RowBox[{"pretty", "@", "lastgood"}]}], "]"}]}]}], "]"}]}], 
            "]"}]}], "]"}]}]}], "]"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Manipulate", "[", 
  RowBox[{"foo", ",", 
   RowBox[{"Button", "[", 
    RowBox[{"\"\<Gen\>\"", ",", 
     RowBox[{"foo", "=", 
      RowBox[{"trial", "[", "]"}]}]}], "]"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
    Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
    1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{
      Hold[
       Button["Gen", $CellContext`foo = $CellContext`trial[]]], 
      Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
    2957., {190.9375, 198.0625}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, "Variables" :> {}, "ControllerVariables" :> {}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> $CellContext`foo, 
      "Specifications" :> {
        Button["Gen", $CellContext`foo = $CellContext`trial[]]}, 
      "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{3012., {247., 254.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "[", "\[IndentingNewLine]", 
  RowBox[{"{", 
   RowBox[{
   "count", ",", "score", ",", "scorevec", ",", "maxscore", ",", 
    "currentstring", ",", "caught"}], "}"}], "]"}]], "Input"],

Cell[BoxData[
 DynamicBox[
  ToBoxes[{$CellContext`count, $CellContext`score, $CellContext`scorevec, \
$CellContext`maxscore, $CellContext`currentstring, $CellContext`caught}, 
   StandardForm],
  ImageSizeCache->{1218., {130., 12.2509765625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "[", 
  RowBox[{"pretty", "@", "lastgood"}], "]"}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`pretty[$CellContext`lastgood], StandardForm],
  ImageSizeCache->{2489., {190.9375, 198.0625}}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"count", "=", "0"}], ";", 
  RowBox[{"Do", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"count", "++"}], ";", 
     RowBox[{"trial", "[", "]"}]}], ",", 
    RowBox[{"{", "100000000", "}"}]}], "]"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Genetic Search", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"ClearAll", "[", "\[IndentingNewLine]", 
    RowBox[{"(*", " ", 
     RowBox[{"GLOBAL", " ", "STATE"}], " ", "*)"}], "\[IndentingNewLine]", 
    RowBox[{"pool", ",", "generation", ",", "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{"TUNING", " ", "PARAMETERS"}], " ", "*)"}], 
     "\[IndentingNewLine]", "generationSize", ",", "\[IndentingNewLine]", 
     "geneLength", ",", "\[IndentingNewLine]", "mutationProbability", ",", 
     "\[IndentingNewLine]", "maxRecombinationPoints", ",", 
     "\[IndentingNewLine]", 
     RowBox[{"(*", " ", 
      RowBox[{
       RowBox[{"FUNCTIONS", " ", "&"}], " ", "RULES"}], " ", "*)"}], 
     "\[IndentingNewLine]", "repool", ",", "fitness", ",", "symbolizer", ",", 
     "run", ",", "bin", ",", "\[IndentingNewLine]", "scoreResult", ",", 
     "swap", ",", "recombine", ",", "mutate"}], "]"}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"generationSize", "=", 
    RowBox[{"4", "*", "3"}]}], ";"}], 
  RowBox[{"(*", " ", 
   RowBox[{"must", " ", "be", " ", "divisible", " ", "by", " ", "four"}], " ",
    "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"mutationProbability", "=", "0.10"}], ";"}], "\[IndentingNewLine]", 

 RowBox[{
  RowBox[{
   RowBox[{"geneLength", "=", "40"}], ";"}], " ", 
  RowBox[{"(*", " ", 
   RowBox[{"can", " ", 
    RowBox[{"change", "!"}]}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"maxRecombinationPoints", "=", 
    RowBox[{"geneLength", "/", "10"}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"bin", "[", "bool_", "]"}], ":=", 
    RowBox[{"If", "[", 
     RowBox[{"bool", ",", "1", ",", "0"}], "]"}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"repool", "[", "]"}], ":=", 
   RowBox[{"pool", "=", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"randomString", "[", "geneLength", "]"}], ",", 
      RowBox[{"{", "generationSize", "}"}]}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"repool", "[", "]"}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"symbolizer", "=", 
   RowBox[{"Dispatch", "[", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"iul", "\[Rule]", "\"\<iul\>\""}], ",", 
      RowBox[{"iur", "\[Rule]", "\"\<iur\>\""}], ",", "\[IndentingNewLine]", 
      RowBox[{"ill", "\[Rule]", "\"\<ill\>\""}], ",", 
      RowBox[{"ilr", "\[Rule]", "\"\<ilr\>\""}], ",", "\[IndentingNewLine]", 
      RowBox[{"plus", "\[Rule]", "\"\<+\>\""}], ",", 
      RowBox[{"minus", "\[Rule]", "\"\<-\>\""}], ",", 
      RowBox[{"dot", "\[Rule]", "\"\<.\>\""}], ",", "\[IndentingNewLine]", 
      RowBox[{"true", "\[Rule]", "\"\<t\>\""}], ",", 
      RowBox[{"false", "\[Rule]", "\"\<f\>\""}], ",", "\[IndentingNewLine]", 
      RowBox[{"falseMatrix", "\[Rule]", "\"\<f\>\""}], ",", 
      RowBox[{"trueMatrix", "\[Rule]", "\"\<t\>\""}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Transpose", "\[Rule]", "\"\<T\>\""}]}], "}"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"scoreResult", "[", 
    RowBox[{"{", 
     RowBox[{"tt_", ",", "tf_", ",", "ft_", ",", "ff_"}], "}"}], "]"}], ":=", 
   
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"score", "=", "0"}], ",", 
       RowBox[{"scorevec", "=", 
        RowBox[{"ConstantArray", "[", 
         RowBox[{"0", ",", "4"}], "]"}]}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"Length", "@", "tt"}], ">", "0"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"score", "=", "0"}], ";", "\[IndentingNewLine]", 
         RowBox[{"score", "+=", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
            "scorevec", "\[LeftDoubleBracket]", "1", 
             "\[RightDoubleBracket]"}], "=", 
            RowBox[{"bin", "[", 
             RowBox[{"falsey", "[", 
              RowBox[{
              "tt", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
              "]"}], "]"}]}], ")"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"score", "+=", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
            "scorevec", "\[LeftDoubleBracket]", "2", 
             "\[RightDoubleBracket]"}], "=", 
            RowBox[{"bin", "[", 
             RowBox[{"truthy", "[", 
              RowBox[{
              "tf", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
              "]"}], "]"}]}], ")"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"score", "+=", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
            "scorevec", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}], "=", 
            RowBox[{"bin", "[", 
             RowBox[{"truthy", "[", 
              RowBox[{
              "ft", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
              "]"}], "]"}]}], ")"}]}], ";", "\[IndentingNewLine]", 
         RowBox[{"score", "+=", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{
            "scorevec", "\[LeftDoubleBracket]", "4", 
             "\[RightDoubleBracket]"}], "=", 
            RowBox[{"bin", "[", 
             RowBox[{"truthy", "[", 
              RowBox[{
              "ff", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
              "]"}], "]"}]}], ")"}]}], ";"}]}], "\[IndentingNewLine]", "]"}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<score\>\"", "\[Rule]", "score"}], ",", 
        RowBox[{"\"\<scorevec\>\"", "\[Rule]", "scorevec"}]}], "}"}]}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"fitness", "[", "gene_", "]"}], ":=", 
   RowBox[{
    RowBox[{"fitness", "[", "gene", "]"}], "=", "\[IndentingNewLine]", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"score", "=", "0"}], ",", 
        RowBox[{"scorevec", "=", 
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0", ",", "4"}], "]"}]}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"With", "[", 
       RowBox[{
        RowBox[{"{", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"tt", "=", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"clear", "[", "]"}], ";", 
             RowBox[{"push", "[", "p", "]"}], ";", 
             RowBox[{"push", "[", "q", "]"}], ";", 
             RowBox[{"exec", "[", "gene", "]"}]}], ")"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"tf", "=", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"clear", "[", "]"}], ";", 
             RowBox[{"push", "[", "p", "]"}], ";", 
             RowBox[{"push", "[", "aq", "]"}], ";", 
             RowBox[{"exec", "[", "gene", "]"}]}], ")"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"ft", "=", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"clear", "[", "]"}], ";", 
             RowBox[{"push", "[", "ap", "]"}], ";", 
             RowBox[{"push", "[", "q", "]"}], ";", 
             RowBox[{"exec", "[", "gene", "]"}]}], ")"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"ff", "=", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"clear", "[", "]"}], ";", 
             RowBox[{"push", "[", "ap", "]"}], ";", 
             RowBox[{"push", "[", "aq", "]"}], ";", 
             RowBox[{"exec", "[", "gene", "]"}]}], ")"}]}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"result", "=", 
            RowBox[{"{", 
             RowBox[{"tt", ",", "tf", ",", "ft", ",", "ff"}], "}"}]}], "}"}], 
          ",", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{
              RowBox[{"\"\<gene\>\"", "\[Rule]", "gene"}], "/.", 
              "symbolizer"}], ",", 
             RowBox[{
              RowBox[{"\"\<result\>\"", "\[Rule]", "result"}], "/.", 
              "symbolizer"}], ",", "\[IndentingNewLine]", 
             RowBox[{"\"\<length\>\"", "\[Rule]", 
              RowBox[{"Length", "@", "gene"}]}]}], "}"}], 
           "\[IndentingNewLine]", "~", "Join", "~", 
           RowBox[{"(", 
            RowBox[{"scoreResult", "@", "result"}], ")"}]}]}], "]"}]}], 
       "]"}]}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"mutate", "[", "survivor_", "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"RandomReal", "[", "]"}], "<", "mutationProbability"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"With", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"position", "=", 
         RowBox[{"RandomInteger", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", 
            RowBox[{"\"\<length\>\"", "/.", "survivor"}]}], "}"}], "]"}]}], 
        "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"oldInstruction", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"\"\<gene\>\"", "/.", "survivor"}], ")"}], 
            "\[LeftDoubleBracket]", "position", "\[RightDoubleBracket]"}]}], 
          "}"}], ",", "\[IndentingNewLine]", 
         RowBox[{"With", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"newInstructionSet", "=", 
             RowBox[{"Complement", "[", 
              RowBox[{"instructionSet", ",", 
               RowBox[{"{", "oldInstruction", "}"}]}], "]"}]}], "}"}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"With", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"newInstruction", "=", 
               RowBox[{"RandomChoice", "[", "newInstructionSet", "]"}]}], 
              "}"}], ",", "\[IndentingNewLine]", 
             RowBox[{"Module", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"oldGene", "=", 
                 RowBox[{"(", 
                  RowBox[{"\"\<gene\>\"", "/.", "survivor"}], ")"}]}], "}"}], 
               ",", "\[IndentingNewLine]", 
               RowBox[{"(*", 
                RowBox[{
                 RowBox[{"Print", "[", 
                  RowBox[{
                   RowBox[{"{", 
                    RowBox[{
                    "position", ",", "oldInstruction", ",", "newInstruction", 
                    ",", "oldGene"}], "}"}], "/.", "symbolizer"}], "]"}], 
                 ";"}], "*)"}], "\[IndentingNewLine]", 
               RowBox[{
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{
                  "oldGene", "\[LeftDoubleBracket]", "position", 
                   "\[RightDoubleBracket]"}], "=", "newInstruction"}], ")"}], 
                ";", "\[IndentingNewLine]", 
                RowBox[{"(*", 
                 RowBox[{
                  RowBox[{"Print", "[", 
                   RowBox[{
                    RowBox[{"{", "oldGene", "}"}], "/.", "symbolizer"}], 
                   "]"}], ";"}], "*)"}], "\[IndentingNewLine]", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"\"\<gene\>\"", "\[Rule]", "oldGene"}], ",", 
                  "\[IndentingNewLine]", 
                  RowBox[{
                   RowBox[{"\"\<length\>\"", "\[Rule]", "\"\<length\>\""}], "/.",
                    "survivor"}]}], "}"}]}]}], "]"}]}], "]"}]}], "]"}]}], 
        "]"}]}], "]"}], ",", "\[IndentingNewLine]", "survivor"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"swap", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"g1_", ",", "g2_"}], "}"}], ",", "n_"}], "]"}], ":=", 
   "\[IndentingNewLine]", 
   StyleBox[
    RowBox[{"{", 
     RowBox[{
      RowBox[{
       RowBox[{"g1", "\[LeftDoubleBracket]", 
        RowBox[{";;", "n"}], "\[RightDoubleBracket]"}], "~", "Join", "~", 
       RowBox[{"g2", "\[LeftDoubleBracket]", 
        RowBox[{
         RowBox[{"n", "+", "1"}], ";;"}], "\[RightDoubleBracket]"}]}], ",", 
      RowBox[{
       RowBox[{"g2", "\[LeftDoubleBracket]", 
        RowBox[{";;", "n"}], "\[RightDoubleBracket]"}], "~", "Join", "~", 
       RowBox[{"g1", "\[LeftDoubleBracket]", 
        RowBox[{
         RowBox[{"n", "+", "1"}], ";;"}], "\[RightDoubleBracket]"}]}]}], "}"}],
    FontWeight->"Plain"]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"recombine", "[", 
    RowBox[{"survivor1_", ",", "survivor2_"}], "]"}], ":=", 
   "\[IndentingNewLine]", 
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"l", "=", 
       RowBox[{"Min", "[", 
        RowBox[{
         RowBox[{"\"\<length\>\"", "/.", "survivor1"}], ",", 
         RowBox[{"\"\<length\>\"", "/.", "survivor2"}]}], "]"}]}], "}"}], ",",
      "\[IndentingNewLine]", 
     RowBox[{"With", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"rPoints", "=", 
         RowBox[{
          RowBox[{"RandomInteger", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "l"}], "}"}], ",", 
            RowBox[{"RandomInteger", "[", 
             RowBox[{"{", 
              RowBox[{"0", ",", "maxRecombinationPoints"}], "}"}], "]"}]}], 
           "]"}], "//", "Union"}]}], "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{"Fold", "[", 
        RowBox[{"swap", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"\"\<gene\>\"", "/.", "survivor1"}], ",", 
           RowBox[{"\"\<gene\>\"", "/.", "survivor2"}]}], "}"}], ",", 
         "rPoints"}], "]"}]}], "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"run", "[", "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"recombined", ",", "mutated", ",", "winners"}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"generation", "=", 
       RowBox[{"Sort", "[", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"fitness", "/@", "pool"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"f", ",", "s"}], "}"}], "\[Function]", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"\"\<score\>\"", "/.", "f"}], ")"}], ">", 
           RowBox[{"(", 
            RowBox[{"\"\<score\>\"", "/.", "s"}], ")"}]}]}]}], "]"}]}], ";", 
      "\[IndentingNewLine]", 
      RowBox[{"winners", "=", 
       RowBox[{"generation", "\[LeftDoubleBracket]", 
        RowBox[{";;", 
         RowBox[{"generationSize", "/", "2"}]}], "\[RightDoubleBracket]"}]}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"mutated", "=", 
       RowBox[{"mutate", "/@", "winners"}]}], ";", "\[IndentingNewLine]", 
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"Not", "@", 
         RowBox[{"Divisible", "[", 
          RowBox[{"generationSize", ",", "4"}], "]"}]}], ",", 
        RowBox[{"Throw", "[", "\"\<bad generationSize\>\"", "]"}]}], "]"}], 
      ";", "\[IndentingNewLine]", 
      RowBox[{"(*", 
       RowBox[{
        RowBox[{"recombined", "=", 
         RowBox[{
          RowBox[{"MapThread", "[", 
           RowBox[{"recombine", ",", 
            RowBox[{"{", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"mutated", "\[LeftDoubleBracket]", 
               RowBox[{";;", 
                RowBox[{"generationSize", "/", "4"}]}], 
               "\[RightDoubleBracket]"}], ",", "\[IndentingNewLine]", 
              RowBox[{
               RowBox[{"mutated", "\[LeftDoubleBracket]", 
                RowBox[{"1", "+", 
                 RowBox[{"generationSize", "/", "4"}]}], 
                "\[RightDoubleBracket]"}], ";;"}]}], "}"}]}], "]"}], "//", 
          RowBox[{
           RowBox[{"Flatten", "[", 
            RowBox[{"#", ",", "1"}], "]"}], "&"}]}]}], ";"}], "*)"}], 
      "\[IndentingNewLine]", "mutated"}]}], "\[IndentingNewLine]", "]"}]}], 
  ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{"<<", "\"\<Jacquard.m\>\""}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"repool", "[", "]"}], ";", 
  RowBox[{
   RowBox[{
    RowBox[{"run", "[", "]"}], "/.", "symbolizer"}], "//", 
   "Length"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"bad exec: {___}\\\"]\\)\
\[NoBreak] returned to top level. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", \
ButtonNote -> \\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"bad exec: {___}\"\>", "]"}], "]"}]], "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]],

Cell[CellGroupData[{

Cell["I caught a fish!", "Section"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{
   "firstFish", ",", "fish", ",", "tt", ",", "tf", ",", "ft", ",", "ff"}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"fish", "=", 
   RowBox[{"{", 
    RowBox[{
    "CHF", ",", "dot", ",", "iul", ",", "AMV", ",", "iul", ",", "plus", ",", 
     "ill", ",", "iul", ",", "CY", ",", "ill", ",", "AMV"}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"clear", "[", "]"}], ";", 
  RowBox[{"tt", "=", 
   RowBox[{"exec", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"p", ",", "q"}], "}"}], "~", "Join", "~", "fish"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"clear", "[", "]"}], ";", 
  RowBox[{"tf", "=", 
   RowBox[{"exec", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"p", ",", "aq"}], "}"}], "~", "Join", "~", "fish"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"clear", "[", "]"}], ";", 
  RowBox[{"ft", "=", 
   RowBox[{"exec", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"ap", ",", "q"}], "}"}], "~", "Join", "~", "fish"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"clear", "[", "]"}], ";", 
  RowBox[{"ff", "=", 
   RowBox[{"exec", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"ap", ",", "aq"}], "}"}], "~", "Join", "~", "fish"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Grid", "[", 
  RowBox[{"MapThread", "[", 
   RowBox[{"Map", ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         RowBox[{"pretty", "[", 
          RowBox[{"{", "#", "}"}], "]"}], "&"}], ",", 
        RowBox[{
         RowBox[{"falsey", "[", 
          RowBox[{"#", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}],
           "]"}], "&"}], ",", "Length"}], "}"}], ",", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"tt", ",", "tf", ",", "ft", ",", "ff"}], "}"}], ",", 
        RowBox[{"{", "3", "}"}]}], "]"}]}], "}"}]}], "]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"bad exec: {___}\\\"]\\)\
\[NoBreak] returned to top level. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", \
ButtonNote -> \\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"bad exec: {___}\"\>", "]"}], "]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"bad exec: {___}\\\"]\\)\
\[NoBreak] returned to top level. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", \
ButtonNote -> \\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"bad exec: {___}\"\>", "]"}], "]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"bad exec: {___}\\\"]\\)\
\[NoBreak] returned to top level. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", \
ButtonNote -> \\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"bad exec: {___}\"\>", "]"}], "]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"bad exec: {___}\\\"]\\)\
\[NoBreak] returned to top level. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", \
ButtonNote -> \\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"bad exec: {___}\"\>", "]"}], "]"}]], "Output"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Part", "::", "partd"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Part specification \[NoBreak]\\!\\(tt \[LeftDoubleBracket] \
1 \[RightDoubleBracket]\\)\[NoBreak] is longer than depth of object. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/partd\\\", \
ButtonNote -> \\\"Part::partd\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Part", "::", "partd"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Part specification \[NoBreak]\\!\\(tt \[LeftDoubleBracket] \
1 \[RightDoubleBracket]\\)\[NoBreak] is longer than depth of object. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/partd\\\", \
ButtonNote -> \\\"Part::partd\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Part", "::", "partd"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Part specification \[NoBreak]\\!\\(tf \[LeftDoubleBracket] \
1 \[RightDoubleBracket]\\)\[NoBreak] is longer than depth of object. \
\\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", \
ButtonFrame->None, ButtonData:>\\\"paclet:ref/message/General/partd\\\", \
ButtonNote -> \\\"Part::partd\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"General", "::", "stop"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Further output of \[NoBreak]\\!\\(\\*StyleBox[\\(Part :: \
partd\\), \\\"MessageName\\\"]\\)\[NoBreak] will be suppressed during this \
calculation. \\!\\(\\*ButtonBox[\\\"\[RightSkeleton]\\\", \
ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/General/stop\\\", ButtonNote -> \
\\\"General::stop\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     RowBox[{"Grid", "[", 
      RowBox[{"{", "tt", "}"}], "]"}], 
     RowBox[{"Grid", "[", 
      RowBox[{"{", "tf", "}"}], "]"}], 
     RowBox[{"Grid", "[", 
      RowBox[{"{", "ft", "}"}], "]"}], 
     RowBox[{"Grid", "[", 
      RowBox[{"{", "ff", "}"}], "]"}]},
    {"False", "False", "False", "False"},
    {"0", "0", "0", "0"}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"PRENAND", "[", 
   RowBox[{"m1_", ",", "m2_"}], "]"}], ":=", 
  RowBox[{"iul", "+", 
   RowBox[{"AMV", "[", 
    RowBox[{"iul", ",", 
     RowBox[{"m1", ".", 
      RowBox[{"CHF", "[", "m2", "]"}]}]}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Grid", "[", 
  RowBox[{"{", 
   RowBox[{"M", "/@", 
    RowBox[{"MapThread", "[", 
     RowBox[{"PRENAND", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"p", ",", "p", ",", "ap", ",", "ap"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"q", ",", "aq", ",", "q", ",", "aq"}], "}"}]}], "}"}]}], 
     "]"}]}], "}"}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {
          RowBox[{"1", "+", 
           RowBox[{"a", " ", "x"}], "+", 
           RowBox[{"b", " ", "z"}]}], 
          RowBox[{
           RowBox[{"b", " ", "w"}], "+", 
           RowBox[{"a", " ", "y"}]}], "0", "0"},
         {
          RowBox[{
           RowBox[{"c", " ", "x"}], "+", 
           RowBox[{"d", " ", "z"}]}], 
          RowBox[{"1", "+", 
           RowBox[{"d", " ", "w"}], "+", 
           RowBox[{"c", " ", "y"}]}], "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, 
          "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "1", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, 
          "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "1", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, 
          "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]], 
     TagBox[
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "1", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, 
          "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
      Function[BoxForm`e$, 
       MatrixForm[BoxForm`e$]]]}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"AMV", "[", 
   RowBox[{
    RowBox[{"CY", "[", 
     RowBox[{
      RowBox[{"iul", "+", 
       RowBox[{"AMV", "[", 
        RowBox[{"iul", ",", 
         RowBox[{"p", ".", 
          RowBox[{"CHF", "[", "q", "]"}]}]}], "]"}]}], ",", "ill", ",", 
      "iul"}], "]"}], ",", "ill"}], "]"}], "//", "M"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"},
     {
      RowBox[{"1", "+", 
       RowBox[{"a", " ", "x"}], "+", 
       RowBox[{"b", " ", "z"}]}], 
      RowBox[{
       RowBox[{"b", " ", "w"}], "+", 
       RowBox[{"a", " ", "y"}]}], "0", "0"},
     {
      RowBox[{
       RowBox[{"c", " ", "x"}], "+", 
       RowBox[{"d", " ", "z"}]}], 
      RowBox[{"1", "+", 
       RowBox[{"d", " ", "w"}], "+", 
       RowBox[{"c", " ", "y"}]}], "0", "0"}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["HORIZON", "Section"],

Cell["Don't look below this line.", "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"saveMe", "=", 
   RowBox[{"{", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"CHF", ",", "dot", ",", "plus", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        "pop", ",", "AMV", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        "plus", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        "true", ",", "CY", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        "AMV", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
        "pop", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
       "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"1", "+", 
               RowBox[{"a", " ", "x"}], "+", 
               RowBox[{"b", " ", "z"}]}], ",", 
              RowBox[{
               RowBox[{"b", " ", "w"}], "+", 
               RowBox[{"a", " ", "y"}]}], ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{
               RowBox[{"c", " ", "x"}], "+", 
               RowBox[{"d", " ", "z"}]}], ",", 
              RowBox[{"1", "+", 
               RowBox[{"d", " ", "w"}], "+", 
               RowBox[{"c", " ", "y"}]}], ",", "0", ",", "0"}], "}"}]}], 
           "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
         "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
         "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
         "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}]}], 
         "}"}]}], "}"}]}], "}"}], "}"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Other Primitive Operators", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"u3d", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"0", "0", "0", "0"},
      {"1", "0", "0", "0"},
      {"0", "1", "0", "0"},
      {"0", "0", "1", "0"}
     }], "\[NoBreak]", ")"}]}], ";", 
  RowBox[{"u4d", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"},
      {"1", "0", "0", "0"}
     }], "\[NoBreak]", ")"}]}], ";", 
  RowBox[{"iul", "=", 
   RowBox[{"(", "\[NoBreak]", GridBox[{
      {"1", "0", "0", "0"},
      {"0", "1", "0", "0"},
      {"0", "0", "0", "0"},
      {"0", "0", "0", "0"}
     }], "\[NoBreak]", ")"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "@", 
  RowBox[{"combos", "[", 
   RowBox[{"u3d", ",", "p"}], "]"}]}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`combos[$CellContext`u3d, $CellContext`p], StandardForm],
  ImageSizeCache->{1261., {48.4375, 55.5625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "@", 
  RowBox[{"combos", "[", 
   RowBox[{"u4d", ",", "p"}], "]"}]}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`combos[$CellContext`u4d, $CellContext`p], StandardForm],
  ImageSizeCache->{1261., {48.4375, 55.5625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "@", 
  RowBox[{"combos", "[", 
   RowBox[{"u4d", ",", "p"}], "]"}]}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`combos[$CellContext`u4d, $CellContext`p], StandardForm],
  ImageSizeCache->{1261., {48.4375, 55.5625}}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]]
}, Open  ]]
},
WindowSize->{1440, 852},
WindowMargins->{{0, Automatic}, {Automatic, 0}},
ShowSelection->True,
Magnification:>FEPrivate`If[
  FEPrivate`Equal[FEPrivate`$VersionNumber, 6.], 1.25, 1.25 Inherited],
FrontEndVersion->"9.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (November 20, \
2012)",
StyleDefinitions->FrontEnd`FileName[{"Creative"}, "NaturalColor.nb", 
  CharacterEncoding -> "UTF-8"]
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 81, 3, 118, "Title"],
Cell[1569, 40, 96, 4, 68, "Subtitle"],
Cell[1668, 46, 502, 8, 82, "Text"],
Cell[CellGroupData[{
Cell[2195, 58, 45, 0, 91, "Section"],
Cell[CellGroupData[{
Cell[2265, 62, 39, 0, 55, "Subsection"],
Cell[2307, 64, 351, 9, 113, "Input",
 InitializationCell->True],
Cell[2661, 75, 357, 9, 113, "Input",
 InitializationCell->True],
Cell[3021, 86, 1737, 35, 308, "Input",
 InitializationCell->True],
Cell[4761, 123, 725, 22, 257, "Input",
 InitializationCell->True]
}, Closed]],
Cell[CellGroupData[{
Cell[5523, 150, 77, 2, 41, "Subsection"],
Cell[5603, 154, 86, 2, 82, "Text"],
Cell[CellGroupData[{
Cell[5714, 160, 437, 13, 212, "Input"],
Cell[6154, 175, 1983, 48, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[8186, 229, 70, 2, 41, "Subsection"],
Cell[8259, 233, 157, 5, 82, "Text"],
Cell[CellGroupData[{
Cell[8441, 242, 353, 12, 112, "Input"],
Cell[8797, 256, 530, 12, 70, "Output"]
}, Open  ]],
Cell[9342, 271, 79, 2, 82, "Text"],
Cell[CellGroupData[{
Cell[9446, 277, 583, 18, 163, "Input"],
Cell[10032, 297, 2929, 76, 70, "Output"]
}, Open  ]],
Cell[12976, 376, 69, 2, 82, "Text"],
Cell[CellGroupData[{
Cell[13070, 382, 340, 10, 112, "Input"],
Cell[13413, 394, 2929, 76, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[16391, 476, 54, 0, 41, "Subsection"],
Cell[16448, 478, 57, 0, 45, "Text"],
Cell[16508, 480, 307, 5, 73, "Text"],
Cell[16818, 487, 323, 7, 73, "Text"],
Cell[17144, 496, 177, 6, 45, "Text"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[17370, 508, 37, 0, 53, "Section"],
Cell[17410, 510, 882, 29, 257, "Input"],
Cell[18295, 541, 274, 8, 257, "Input"],
Cell[18572, 551, 28, 0, 82, "Text"],
Cell[18603, 553, 223, 6, 163, "Input"],
Cell[18829, 561, 374, 13, 93, "Text"],
Cell[CellGroupData[{
Cell[19228, 578, 975, 29, 358, "Input"],
Cell[20206, 609, 4908, 123, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25151, 737, 84, 2, 112, "Input"],
Cell[25238, 741, 4622, 121, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[29909, 868, 28, 0, 53, "Section"],
Cell[29940, 870, 171, 3, 82, "Text"],
Cell[30114, 875, 155, 5, 112, "Input"],
Cell[30272, 882, 217, 4, 135, "Text"]
}, Closed]],
Cell[CellGroupData[{
Cell[30526, 891, 31, 0, 53, "Section"],
Cell[CellGroupData[{
Cell[30582, 895, 40, 0, 101, "Subsection"],
Cell[30625, 897, 107, 3, 82, "Text"],
Cell[30735, 902, 854, 23, 358, "Input"],
Cell[CellGroupData[{
Cell[31614, 929, 255, 9, 112, "Input"],
Cell[31872, 940, 3010, 82, 70, "Output"]
}, Open  ]],
Cell[34897, 1025, 187, 6, 82, "Text"],
Cell[CellGroupData[{
Cell[35109, 1035, 103, 3, 112, "Input"],
Cell[35215, 1040, 852, 21, 70, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[36116, 1067, 41, 0, 101, "Subsection"],
Cell[36160, 1069, 164, 3, 82, "Text"],
Cell[36327, 1074, 867, 25, 358, "Input"],
Cell[CellGroupData[{
Cell[37219, 1103, 256, 9, 112, "Input"],
Cell[37478, 1114, 3189, 82, 70, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[40716, 1202, 41, 0, 101, "Subsection"],
Cell[40760, 1204, 96, 2, 82, "Text"],
Cell[40859, 1208, 190, 6, 113, "Input"],
Cell[CellGroupData[{
Cell[41074, 1218, 80, 2, 112, "Input"],
Cell[41157, 1222, 659, 19, 70, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[41865, 1247, 40, 0, 101, "Subsection"],
Cell[41908, 1249, 95, 2, 82, "Text"],
Cell[42006, 1253, 134, 4, 113, "Input"],
Cell[CellGroupData[{
Cell[42165, 1261, 79, 2, 112, "Input"],
Cell[42247, 1265, 852, 21, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[43136, 1291, 280, 9, 112, "Input"],
Cell[43419, 1302, 1983, 48, 70, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[45451, 1356, 40, 0, 101, "Subsection"],
Cell[45494, 1358, 231, 7, 113, "Input"],
Cell[CellGroupData[{
Cell[45750, 1369, 305, 10, 112, "Input"],
Cell[46058, 1381, 1674, 44, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47769, 1430, 298, 9, 112, "Input"],
Cell[48070, 1441, 12288, 313, 70, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[60407, 1760, 30, 0, 101, "Subsection"],
Cell[60440, 1762, 473, 15, 257, "Input"],
Cell[60916, 1779, 66, 0, 82, "Text"],
Cell[CellGroupData[{
Cell[61007, 1783, 83, 2, 112, "Input"],
Cell[61093, 1787, 31, 0, 70, "Output"]
}, Open  ]],
Cell[61139, 1790, 50, 0, 82, "Text"],
Cell[CellGroupData[{
Cell[61214, 1794, 94, 2, 112, "Input"],
Cell[61311, 1798, 31, 0, 70, "Output"]
}, Open  ]],
Cell[61357, 1801, 75, 0, 82, "Text"],
Cell[61435, 1803, 150, 4, 113, "Input"],
Cell[61588, 1809, 64, 0, 82, "Text"],
Cell[61655, 1811, 150, 4, 113, "Input"],
Cell[61808, 1817, 94, 2, 82, "Text"],
Cell[CellGroupData[{
Cell[61927, 1823, 197, 7, 112, "Input"],
Cell[62127, 1832, 108, 2, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[62272, 1839, 197, 7, 112, "Input"],
Cell[62472, 1848, 106, 2, 70, "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[62639, 1857, 42, 0, 53, "Section"],
Cell[62684, 1859, 277, 5, 59, "Text"],
Cell[CellGroupData[{
Cell[62986, 1868, 27, 0, 44, "Subsection"],
Cell[63016, 1870, 3042, 101, 261, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[66095, 1976, 26, 0, 44, "Subsection"],
Cell[66124, 1978, 282, 5, 59, "Text"],
Cell[66409, 1985, 21542, 593, 2023, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[87988, 2583, 32, 0, 44, "Subsection"],
Cell[88023, 2585, 1576, 55, 154, "Input"],
Cell[CellGroupData[{
Cell[89624, 2644, 30, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[89679, 2648, 161, 5, 75, "Input"],
Cell[89843, 2655, 659, 19, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90539, 2679, 185, 6, 76, "Input"],
Cell[90727, 2687, 8661, 223, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[99425, 2915, 185, 6, 76, "Input"],
Cell[99613, 2923, 8661, 223, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[108311, 3151, 185, 6, 76, "Input"],
Cell[108499, 3159, 8661, 223, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[117209, 3388, 31, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[117265, 3392, 223, 7, 112, "Input"],
Cell[117491, 3401, 11348, 269, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[128888, 3676, 29, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[128942, 3680, 94, 2, 112, "Input"],
Cell[129039, 3684, 1785, 42, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[130861, 3731, 93, 2, 112, "Input"],
Cell[130957, 3735, 1132, 28, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[132126, 3768, 107, 3, 112, "Input"],
Cell[132236, 3773, 936, 26, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[133209, 3804, 121, 3, 112, "Input"],
Cell[133333, 3809, 4568, 109, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[137938, 3923, 151, 4, 112, "Input"],
Cell[138092, 3929, 4232, 97, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[142373, 4032, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[142426, 4036, 120, 3, 112, "Input"],
Cell[142549, 4041, 8574, 193, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[151160, 4239, 150, 4, 112, "Input"],
Cell[151313, 4245, 4240, 97, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[155602, 4348, 30, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[155657, 4352, 122, 3, 112, "Input"],
Cell[155782, 4357, 4569, 109, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[160400, 4472, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[160453, 4476, 497, 15, 163, "Input"],
Cell[160953, 4493, 18098, 420, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[179088, 4918, 120, 3, 112, "Input"],
Cell[179211, 4923, 291142, 6033, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[470402, 10962, 29, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[470456, 10966, 170, 5, 112, "Input"],
Cell[470629, 10973, 5733, 150, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[476399, 11128, 170, 5, 112, "Input"],
Cell[476572, 11135, 5821, 150, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[482430, 11290, 170, 5, 112, "Input"],
Cell[482603, 11297, 5733, 150, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[488373, 11452, 170, 5, 112, "Input"],
Cell[488546, 11459, 5821, 150, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[494416, 11615, 30, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[494471, 11619, 221, 7, 112, "Input"],
Cell[494695, 11628, 6575, 168, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[501319, 11802, 29, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[501373, 11806, 170, 5, 48, "Input"],
Cell[501546, 11813, 6930, 176, 371, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[508513, 11994, 126, 4, 48, "Input"],
Cell[508642, 12000, 540, 17, 67, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[509219, 12022, 178, 5, 48, "Input"],
Cell[509400, 12029, 10914, 252, 379, "Output"]
}, Open  ]]
}, Closed]],
Cell[520341, 12285, 30, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[520396, 12289, 31, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[520452, 12293, 161, 5, 48, "Input"],
Cell[520616, 12300, 4477, 115, 263, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[525142, 12421, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[525195, 12425, 92, 2, 75, "Input"],
Cell[525290, 12429, 63570, 1443, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[588897, 13877, 349, 11, 108, "Input"],
Cell[589249, 13890, 10575, 247, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[599861, 14142, 106, 3, 75, "Input"],
Cell[599970, 14147, 976, 26, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[600995, 14179, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[601048, 14183, 189, 6, 75, "Input"],
Cell[601240, 14191, 4180, 104, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[605469, 14301, 27, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[605521, 14305, 188, 6, 75, "Input"],
Cell[605712, 14313, 4162, 103, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[609923, 14422, 26, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[609974, 14426, 156, 5, 75, "Input"],
Cell[610133, 14433, 4030, 101, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[614212, 14540, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[614265, 14544, 158, 5, 75, "Input"],
Cell[614426, 14551, 3815, 99, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[618290, 14656, 27, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[618342, 14660, 157, 5, 75, "Input"],
Cell[618502, 14667, 4023, 101, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[622574, 14774, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[622627, 14778, 259, 8, 75, "Input"],
Cell[622889, 14788, 9528, 226, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[632466, 15020, 29, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[632520, 15024, 169, 5, 75, "Input"],
Cell[632692, 15031, 8188, 196, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[640917, 15232, 159, 5, 75, "Input"],
Cell[641079, 15239, 4025, 101, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[645141, 15345, 134, 4, 75, "Input"],
Cell[645278, 15351, 935, 31, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[646262, 15388, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[646315, 15392, 168, 5, 75, "Input"],
Cell[646486, 15399, 8187, 196, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[654710, 15600, 158, 5, 75, "Input"],
Cell[654871, 15607, 4024, 101, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[658932, 15713, 133, 4, 75, "Input"],
Cell[659068, 15719, 934, 31, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[660051, 15756, 28, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[660104, 15760, 114, 3, 75, "Input"],
Cell[660221, 15765, 1137, 28, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[661395, 15798, 143, 4, 75, "Input"],
Cell[661541, 15804, 284, 9, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[661862, 15818, 177, 6, 75, "Input"],
Cell[662042, 15826, 284, 9, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[662353, 15839, 29, 0, 22, "Subsubsection"],
Cell[662385, 15841, 30, 0, 22, "Subsubsection"],
Cell[662418, 15843, 27, 0, 22, "Subsubsection"],
Cell[662448, 15845, 27, 0, 22, "Subsubsection"],
Cell[662478, 15847, 27, 0, 22, "Subsubsection"],
Cell[662508, 15849, 27, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[662560, 15853, 29, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[662614, 15857, 62, 1, 75, "Input"],
Cell[662679, 15860, 1137, 28, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[663853, 15893, 63, 1, 75, "Input"],
Cell[663919, 15896, 2045, 49, 70, "Output"]
}, Open  ]]
}, Closed]],
Cell[665991, 15949, 28, 0, 22, "Subsubsection"]
}, Open  ]],
Cell[CellGroupData[{
Cell[666056, 15954, 34, 0, 44, "Subsection"],
Cell[CellGroupData[{
Cell[666115, 15958, 50, 0, 31, "Subsubsection"],
Cell[666168, 15960, 150, 4, 48, "Input"],
Cell[CellGroupData[{
Cell[666343, 15968, 40, 0, 48, "Input"],
Cell[666386, 15970, 432, 8, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[666855, 15983, 5722, 145, 637, "Input"],
Cell[672580, 16130, 3829, 99, 657, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[676458, 16235, 42, 0, 31, "Subsubsection"],
Cell[676503, 16237, 94, 2, 36, "Text"],
Cell[676600, 16241, 144, 3, 36, "Text"],
Cell[676747, 16246, 8321, 202, 1099, "Input"],
Cell[685071, 16450, 2677, 69, 343, "Input"],
Cell[687751, 16521, 25, 0, 36, "Text"],
Cell[CellGroupData[{
Cell[687801, 16525, 1539, 37, 196, "Input"],
Cell[689343, 16564, 2045, 45, 173, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[691425, 16614, 439, 14, 49, "Input"],
Cell[691867, 16630, 7682, 194, 315, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[699586, 16829, 540, 16, 49, "Input"],
Cell[700129, 16847, 474, 14, 48, "Output"]
}, Open  ]],
Cell[700618, 16864, 122, 3, 36, "Text"],
Cell[CellGroupData[{
Cell[700765, 16871, 385, 11, 49, "Input"],
Cell[701153, 16884, 5643, 152, 295, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[706845, 17042, 64, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[706934, 17046, 153, 4, 48, "Input"],
Cell[707090, 17052, 8198, 171, 616, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[715325, 17228, 126, 2, 49, "Input"],
Cell[715454, 17232, 29, 0, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[715520, 17237, 458, 12, 91, "Input"],
Cell[715981, 17251, 31, 0, 48, "Output"]
}, Open  ]],
Cell[716027, 17254, 533, 12, 154, "Input"],
Cell[716563, 17268, 304, 10, 70, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[716904, 17283, 77, 2, 31, "Subsubsection"],
Cell[716984, 17287, 521, 8, 82, "Text"],
Cell[CellGroupData[{
Cell[717530, 17299, 186, 6, 48, "Input"],
Cell[717719, 17307, 8849, 227, 473, "Output"]
}, Open  ]],
Cell[726583, 17537, 10283, 257, 868, "Input"],
Cell[736869, 17796, 189, 5, 48, "Input"],
Cell[CellGroupData[{
Cell[737083, 17805, 148, 2, 49, "Input"],
Cell[737234, 17809, 29, 0, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[737300, 17814, 495, 13, 91, "Input"],
Cell[737798, 17829, 31, 0, 48, "Output"]
}, Open  ]],
Cell[737844, 17832, 588, 12, 154, "Input"],
Cell[738435, 17846, 304, 10, 70, "Input"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[738788, 17862, 40, 0, 44, "Subsection"],
Cell[738831, 17864, 853, 25, 154, "Input"],
Cell[739687, 17891, 6859, 163, 511, "Input"],
Cell[CellGroupData[{
Cell[746571, 18058, 216, 6, 48, "Input"],
Cell[746790, 18066, 1424, 30, 534, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[748251, 18101, 218, 5, 70, "Input"],
Cell[748472, 18108, 256, 5, 175, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[748765, 18118, 95, 2, 49, "Input"],
Cell[748863, 18122, 157, 3, 423, "Output"]
}, Open  ]],
Cell[749035, 18128, 243, 8, 48, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[749315, 18141, 36, 0, 44, "Subsection"],
Cell[749354, 18143, 16217, 417, 1729, "Input"],
Cell[765574, 18562, 62, 1, 48, "Input"],
Cell[CellGroupData[{
Cell[765661, 18567, 171, 6, 49, "Input"],
Cell[765835, 18575, 434, 9, 29, "Message"],
Cell[766272, 18586, 112, 2, 49, "Output"]
}, Open  ]]
}, Closed]]
}, Open  ]],
Cell[CellGroupData[{
Cell[766445, 18595, 35, 0, 91, "Section"],
Cell[CellGroupData[{
Cell[766505, 18599, 2020, 63, 175, "Input"],
Cell[768528, 18664, 434, 9, 29, "Message"],
Cell[768965, 18675, 112, 2, 49, "Output"],
Cell[769080, 18679, 434, 9, 29, "Message"],
Cell[769517, 18690, 112, 2, 49, "Output"],
Cell[769632, 18694, 434, 9, 29, "Message"],
Cell[770069, 18705, 112, 2, 49, "Output"],
Cell[770184, 18709, 434, 9, 29, "Message"],
Cell[770621, 18720, 112, 2, 49, "Output"],
Cell[770736, 18724, 464, 9, 29, "Message"],
Cell[771203, 18735, 464, 9, 29, "Message"],
Cell[771670, 18746, 464, 9, 29, "Message"],
Cell[772137, 18757, 486, 10, 29, "Message"],
Cell[772626, 18769, 498, 16, 93, "Output"]
}, Open  ]],
Cell[773139, 18788, 257, 8, 49, "Input"],
Cell[CellGroupData[{
Cell[773421, 18800, 398, 12, 75, "Input"],
Cell[773822, 18814, 3454, 98, 178, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[777313, 18917, 347, 11, 75, "Input"],
Cell[777663, 18930, 1011, 31, 178, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[778723, 18967, 26, 0, 53, "Section"],
Cell[778752, 18969, 43, 0, 36, "Text"],
Cell[778798, 18971, 14118, 340, 406, "Input"],
Cell[CellGroupData[{
Cell[792941, 19315, 47, 0, 44, "Subsection"],
Cell[792991, 19317, 670, 22, 115, "Input"],
Cell[CellGroupData[{
Cell[793686, 19343, 114, 3, 49, "Input"],
Cell[793803, 19348, 166, 3, 137, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[794006, 19356, 114, 3, 76, "Input"],
Cell[794123, 19361, 166, 3, 213, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[794326, 19369, 114, 3, 49, "Input"],
Cell[794443, 19374, 166, 3, 137, "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature OvTJixcG88wuJDgxCsHgv4T5 *)
