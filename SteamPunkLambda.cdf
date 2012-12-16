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
NotebookDataLength[    806204,      19824]
NotebookOptionsPosition[    788852,      19237]
NotebookOutlinePosition[    789402,      19257]
CellTagsIndexPosition[    789359,      19254]
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

Cell[TextData[{
 "Can we do arbitrary computations using only operations on 4x4 matrices (",
 StyleBox["punks",
  FontSlant->"Italic"],
 ")? We'd like that since we might be able to run them on a GPU (a ",
 StyleBox["steam engine",
  FontSlant->"Italic"],
 "). The idea is to compile ordinary code to operations on punks, as if that \
were the instruction set of our machine. Contrast this against OpenACC or \
CUDA, which are basically DSLs for the GPU embedded in ordinary programming \
languages. Those give you ways to write \"machine-sympathetic code\" for the \
GPU in C or C++ or whatever. We want a way to write ordinary code -- not \
necessarily machine-sympathetic -- and compile it so that it runs in the GPU."
}], "Text"],

Cell[CellGroupData[{

Cell["PUNKS AND SKAS", "Section"],

Cell[TextData[{
 "A ",
 StyleBox["[PUNK]",
  FontWeight->"Bold"],
 " is a 4x4 matrix. A ",
 StyleBox["[SKA]",
  FontWeight->"Bold"],
 " is a 2x2 block in a punk. There are four skas in a punk: ",
 StyleBox["[UL]",
  FontWeight->"Bold"],
 ", ",
 StyleBox["[UR]",
  FontWeight->"Bold"],
 ", ",
 StyleBox["[LL]",
  FontWeight->"Bold"],
 ", and ",
 StyleBox["[LR]",
  FontWeight->"Bold"],
 " (upper-left, upper-right, lower-left, lower-right)"
}], "Text"],

Cell[CellGroupData[{

Cell["Symbolic Punks", "Subsection"],

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
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Standard display ideas from the \"Insert\" menu\
\>", "Subsection"],

Cell["\<\
Consider arbitrary punks broken into four skas.\
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
}, Open  ]],

Cell[CellGroupData[{

Cell["New display ideas from the @SE chat room", "Subsection"],

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

Cell["Thanks to rojo @Mathematica.stackexchange.com", "Text"],

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
}, Open  ]],

Cell[CellGroupData[{

Cell["The UL ska is special", "Subsection"],

Cell["Divide matrices into equivalence classes:", "Text"],

Cell["\<\
All matrices with the same upper-left 2x2 block (UL-ska) are equivalent -- \
they all represent the same value in the system. The contents of the other \
three skas are \"machine-state,\" but the value of the punk as a whole is \
just the value of the upper-left ska. \
\>", "Text"],

Cell[TextData[{
 "The prime representative of an equivalence class is the ",
 StyleBox["[CHIEF]",
  FontWeight->"Bold"],
 " of that class. It has the same UL-ska as every other member of the class, \
but zeros elsewhere. To test whether two matrices are equivalent, compare \
them both to their chiefs."
}], "Text"],

Cell[TextData[{
 "The ",
 StyleBox["[MACHINE-STATE]",
  FontWeight->"Bold"],
 " of a matrix is the contents of all skas other than the UL-ska."
}], "Text"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["PRIMITIVE PUNKS", "Section"],

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
}, Open  ]],

Cell[CellGroupData[{

Cell["REGISTERS", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"registers", "=", 
   RowBox[{"{", 
    RowBox[{"iul", ",", "iur", ",", "ill", ",", "ilr"}], "}"}]}], 
  ";"}]], "Input"],

Cell["\<\
UL is like EAX in the x86 machine: it's a special register where you can find \
the result of a computation and where you expect the value of an actual \
argument to a unary function to appear.\
\>", "Text"]
}, Open  ]],

Cell[CellGroupData[{

Cell["INSTRUCTIONS", "Section"],

Cell["\<\
Here are some primitives that will let me simulate a stack machine inside the \
matrices.\
\>", "Text"],

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
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["The AMV Instruction", "Subsection"],

Cell["\<\
Move any one of the four registers into ul, the CHIEF position. \
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
}, Open  ]],

Cell[CellGroupData[{

Cell["POSTFIX CALCULATOR FOR PUNKS", "Section"],

Cell[CellGroupData[{

Cell["Stack", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"ClearAll", "[", 
    RowBox[{
    "pushR", ",", "popR", ",", "dupR", ",", "rotR", ",", "swapR", ",", "topR",
      ",", "nextR", ",", "thirdR"}], "]"}], ";"}], "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{"stack", "-", "to", "-", 
    RowBox[{"stack", " ", "transforms"}]}], " ", "*)"}]}], "\n", 
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
}, Closed]],

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
}, Closed]],

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
}, Open  ]],

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
}, Open  ]],

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
             {"0.3057244971687829`", "0.7306668527732665`", 
              "0.9723690437977799`", "0.8742766452196304`"},
             {"0.8702806228562641`", "0.12913145116011937`", 
              "0.18289620934093787`", "0.3149393550755393`"},
             {"0.9575399885193416`", "0.7199588767377683`", 
              "0.7221652467132997`", "0.2594866822043156`"},
             {"0.44262131520667025`", "0.3129394034918658`", 
              "0.5371517060008557`", "0.8949197750137965`"}
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
             {"0.8427585381526381`", "0.845078513219546`", 
              "0.12636112833648228`", "0.099578165956961`"},
             {"0.37651988123062674`", "0.02995348314553148`", 
              "0.18314129534480483`", "0.1135429562578294`"},
             {"0.5435274593584483`", "0.39169997297256676`", 
              "0.6403442129282102`", "0.47019585372023`"},
             {"0.9768450255873369`", "0.6936567469784383`", 
              "0.42760854290280315`", "0.2867697078398386`"}
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
             {"1.148483035321421`", "1.5757453659928125`", 
              "1.0987301721342622`", "0.9738548111765915`"},
             {"1.2468005040868908`", "0.15908493430565085`", 
              "0.3660375046857427`", "0.42848231133336867`"},
             {"1.50106744787779`", "1.111658849710335`", "1.36250945964151`", 
              "0.7296825359245456`"},
             {"1.4194663407940071`", "1.006596150470304`", 
              "0.9647602489036589`", "1.181689482853635`"}
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
}, Open  ]],

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
             {"0.2987895662211788`", "0.7794271925374885`", 
              "0.02079455380050521`", "0.11289427568609911`"},
             {"0.5626439037348103`", "0.2658804370607577`", 
              "0.6833758896236091`", "0.777861801822832`"},
             {"0.004371569449626689`", "0.9102155437507837`", 
              "0.7548304407862247`", "0.7189947294326302`"},
             {"0.28857347233794295`", "0.5222440350363107`", 
              "0.37040857698540997`", "0.8663982077823391`"}
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
             {"0.44951448641539127`", "0.9227296688462105`", 
              "0.671418855219919`", "0.07308916878837235`"},
             {"0.9054113962331787`", "0.16192770280210778`", 
              "0.18564887573902844`", "0.4001421177188291`"},
             {"0.06540533423672179`", "0.13499342625661437`", 
              "0.9924027290759889`", "0.49092562265088757`"},
             {"0.8169234065541255`", "0.9083408654036718`", 
              "0.43524924748418226`", "0.5622214188959405`"}
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
             {"0.933598552079239`", "0.5072664644239026`", 
              "0.4150864509980773`", "0.40740008760106505`"},
             {"1.1737977046159598`", "1.3610365463584932`", 
              "1.4438779917007032`", "0.9203304364371817`"},
             {"1.4628181710707584`", "0.9064123310829653`", 
              "1.2339533508894307`", "1.1393349307335456`"},
             {"1.3345713292635886`", "1.187828702227022`", 
              "1.0354013390422652`", "0.8990141203730886`"}
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
}, Open  ]],

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
}, Open  ]],

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
         {"0.7435356237823798`", "0.9065906770785219`", "0.5273058179510595`",
           "0.7097277842124521`"},
         {"0.9153551329812575`", "0.991409252968529`", "0.5708633994964265`", 
          "0.4083703173672908`"},
         {"0.9426718169176718`", "4.260674923095564`*^-6", 
          "0.021042761935004206`", "0.4626848466994118`"},
         {"0.6086879377689944`", "0.9524331460033064`", "0.7887545545314094`",
           "0.9981260123461633`"}
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
             {"0.7435356237823798`", "0.9065906770785219`", 
              "0.5273058179510595`", "0.7097277842124521`"},
             {"0.9153551329812575`", "0.991409252968529`", 
              "0.5708633994964265`", "0.4083703173672908`"},
             {"0.9426718169176718`", "4.260674923095564`*^-6", 
              "0.021042761935004206`", "0.4626848466994118`"},
             {"0.6086879377689944`", "0.9524331460033064`", 
              "0.7887545545314094`", "0.9981260123461633`"}
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
         {"0.28167388433331086`", "0.4383495423552233`", 
          "0.17844033432317596`", "0.12453044306956396`"},
         {"0.39190345664086146`", "0.9979160259526376`", 
          "0.6210857544690593`", "0.8595813164784076`"},
         {"0.4153895986406593`", "0.16761463284163725`", "0.745419350839269`",
           "0.7194847238517743`"},
         {"0.04709620476870224`", "0.9611302775169179`", 
          "0.32659552198043973`", "0.37910101402609997`"}
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
             {"0.7435356237823798`", "0.9065906770785219`", 
              "0.5273058179510595`", "0.7097277842124521`"},
             {"0.9153551329812575`", "0.991409252968529`", 
              "0.5708633994964265`", "0.4083703173672908`"},
             {"0.9426718169176718`", "4.260674923095564`*^-6", 
              "0.021042761935004206`", "0.4626848466994118`"},
             {"0.6086879377689944`", "0.9524331460033064`", 
              "0.7887545545314094`", "0.9981260123461633`"}
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
             {"0.28167388433331086`", "0.4383495423552233`", 
              "0.17844033432317596`", "0.12453044306956396`"},
             {"0.39190345664086146`", "0.9979160259526376`", 
              "0.6210857544690593`", "0.8595813164784076`"},
             {"0.4153895986406593`", "0.16761463284163725`", 
              "0.745419350839269`", "0.7194847238517743`"},
             {"0.04709620476870224`", "0.9611302775169179`", 
              "0.32659552198043973`", "0.37910101402609997`"}
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
             {"1.4213076182795414`", "1.2734454292646311`", 
              RowBox[{"-", "0.2640186397600519`"}], 
              RowBox[{"-", "0.9811126583683045`"}]},
             {"2.9308107344706444`", "0.09604477344055207`", 
              "0.17498790277822074`", 
              RowBox[{"-", "0.435409697006766`"}]},
             {"1.7286285349808705`", "2.897355687959492`", 
              RowBox[{"-", "1.2302151458622381`"}], 
              RowBox[{"-", "3.582089713520035`"}]},
             {"0.40594754707389624`", "1.0690180025325682`", 
              "0.22033306176517353`", 
              RowBox[{"-", "0.34254983448977505`"}]}
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
         {"0.28167388433331086`", "0.4383495423552233`", 
          "0.17844033432317596`", "0.12453044306956396`"},
         {"0.39190345664086146`", "0.9979160259526376`", 
          "0.6210857544690593`", "0.8595813164784076`"},
         {"0.4153895986406593`", "0.16761463284163725`", "0.745419350839269`",
           "0.7194847238517743`"},
         {"0.04709620476870224`", "0.9611302775169179`", 
          "0.32659552198043973`", "0.37910101402609997`"}
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
             {"1.4213076182795414`", "1.2734454292646311`", 
              RowBox[{"-", "0.2640186397600519`"}], 
              RowBox[{"-", "0.9811126583683045`"}]},
             {"2.9308107344706444`", "0.09604477344055207`", 
              "0.17498790277822074`", 
              RowBox[{"-", "0.435409697006766`"}]},
             {"1.7286285349808705`", "2.897355687959492`", 
              RowBox[{"-", "1.2302151458622381`"}], 
              RowBox[{"-", "3.582089713520035`"}]},
             {"0.40594754707389624`", "1.0690180025325682`", 
              "0.22033306176517353`", 
              RowBox[{"-", "0.34254983448977505`"}]}
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
             {"0.28167388433331086`", "0.4383495423552233`", 
              "0.17844033432317596`", "0.12453044306956396`"},
             {"0.39190345664086146`", "0.9979160259526376`", 
              "0.6210857544690593`", "0.8595813164784076`"},
             {"0.4153895986406593`", "0.16761463284163725`", 
              "0.745419350839269`", "0.7194847238517743`"},
             {"0.04709620476870224`", "0.9611302775169179`", 
              "0.32659552198043973`", "0.37910101402609997`"}
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
             {"0.7435356237823796`", "0.9065906770785214`", 
              "0.5273058179510588`", "0.7097277842124516`"},
             {"0.9153551329812575`", "0.9914092529685294`", 
              "0.5708633994964264`", "0.40837031736729107`"},
             {"0.9426718169176718`", "4.260674923095564`*^-6", 
              "0.021042761935004428`", "0.462684846699412`"},
             {"0.6086879377689941`", "0.9524331460033066`", 
              "0.7887545545314091`", "0.998126012346163`"}
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
         {"0.7435356237823798`", "0.9065906770785219`", "0.5273058179510595`",
           "0.7097277842124521`"},
         {"0.9153551329812575`", "0.991409252968529`", "0.5708633994964265`", 
          "0.4083703173672908`"},
         {"0.9426718169176718`", "4.260674923095564`*^-6", 
          "0.021042761935004206`", "0.4626848466994118`"},
         {"0.6086879377689944`", "0.9524331460033064`", "0.7887545545314094`",
           "0.9981260123461633`"}
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
             {"0.7435356237823796`", "0.9065906770785214`", 
              "0.5273058179510588`", "0.7097277842124516`"},
             {"0.9153551329812575`", "0.9914092529685294`", 
              "0.5708633994964264`", "0.40837031736729107`"},
             {"0.9426718169176718`", "4.260674923095564`*^-6", 
              "0.021042761935004428`", "0.462684846699412`"},
             {"0.6086879377689941`", "0.9524331460033066`", 
              "0.7887545545314091`", "0.998126012346163`"}
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
             {"0.7435356237823798`", "0.9065906770785219`", 
              "0.5273058179510595`", "0.7097277842124521`"},
             {"0.9153551329812575`", "0.991409252968529`", 
              "0.5708633994964265`", "0.4083703173672908`"},
             {"0.9426718169176718`", "4.260674923095564`*^-6", 
              "0.021042761935004206`", "0.4626848466994118`"},
             {"0.6086879377689944`", "0.9524331460033064`", 
              "0.7887545545314094`", "0.9981260123461633`"}
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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
         {"0.4496736696353447`", "0.6247977306228967`", 
          "0.03059959234543652`", "0.07267693193069436`"},
         {"0.0991423662902704`", "0.26648070299648885`", 
          "0.5605817065499232`", "0.8394592146209778`"},
         {"0.8066832385399965`", "0.8049248955124733`", 
          "0.41816138713220874`", "0.849000469247247`"},
         {"0.6846576796213943`", "0.7092620523976092`", "0.7230529319809615`",
           "0.843565255888181`"}
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
             {"0.4496736696353447`", "0.6247977306228967`", 
              "0.03059959234543652`", "0.07267693193069436`"},
             {"0.0991423662902704`", "0.26648070299648885`", 
              "0.5605817065499232`", "0.8394592146209778`"},
             {"0.8066832385399965`", "0.8049248955124733`", 
              "0.41816138713220874`", "0.849000469247247`"},
             {"0.6846576796213943`", "0.7092620523976092`", 
              "0.7230529319809615`", "0.843565255888181`"}
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
         {"0.4496736696353447`", "0.6247977306228967`", 
          "0.03059959234543652`", "0.07267693193069436`"},
         {"0.0991423662902704`", "0.26648070299648885`", 
          "0.5605817065499232`", "0.8394592146209778`"},
         {"0.8066832385399965`", "0.8049248955124733`", 
          "0.41816138713220874`", "0.849000469247247`"},
         {"0.6846576796213943`", "0.7092620523976092`", "0.7230529319809615`",
           "0.843565255888181`"}
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
             {"0.4496736696353447`", "0.6247977306228967`", 
              "0.03059959234543652`", "0.07267693193069436`"},
             {"0.0991423662902704`", "0.26648070299648885`", 
              "0.5605817065499232`", "0.8394592146209778`"},
             {"0.8066832385399965`", "0.8049248955124733`", 
              "0.41816138713220874`", "0.849000469247247`"},
             {"0.6846576796213943`", "0.7092620523976092`", 
              "0.7230529319809615`", "0.843565255888181`"}
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
             {"0.4496736696353447`", "0.6247977306228967`", 
              "0.03059959234543652`", "0.07267693193069436`"},
             {"0.0991423662902704`", "0.26648070299648885`", 
              "0.5605817065499232`", "0.8394592146209778`"},
             {"0.8066832385399965`", "0.8049248955124733`", 
              "0.41816138713220874`", "0.849000469247247`"},
             {"0.6846576796213943`", "0.7092620523976092`", 
              "0.7230529319809615`", "0.843565255888181`"}
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
             {"0.4496736696353447`", "0.6247977306228967`", 
              "0.03059959234543652`", "0.07267693193069436`"},
             {"0.0991423662902704`", "0.26648070299648885`", 
              "0.5605817065499232`", "0.8394592146209778`"},
             {"0.8066832385399965`", "0.8049248955124733`", 
              "0.41816138713220874`", "0.849000469247247`"},
             {"0.6846576796213943`", "0.7092620523976092`", 
              "0.7230529319809615`", "0.843565255888181`"}
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
              RowBox[{"-", "2.823549069845795`"}], 
              RowBox[{"-", "3.220039228102414`"}], "1.9425677423229324`", 
              "1.4925431689589528`"},
             {"3.73242117551231`", "2.1993670812303554`", 
              RowBox[{"-", "1.5115190082476149`"}], 
              RowBox[{"-", "0.9889685821940538`"}]},
             {"0.025546147421023457`", 
              RowBox[{"-", "0.576240804683213`"}], 
              RowBox[{"-", "2.937213229739501`"}], "3.5273731667739603`"},
             {
              RowBox[{"-", "0.8684228760947037`"}], "1.2581712821126867`", 
              "2.211838118810874`", 
              RowBox[{"-", "2.217873192142675`"}]}
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
             {"0.9999999999999999`", "0", "0", "0"},
             {"0", "1.`", "0", "0"},
             {"0", "0", "0.9999999999999996`", "0"},
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
}, Open  ]],

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
         {"0.263468854734886`", "0.4764418137534083`", "0.31352649542897204`",
           "0.5460783285641142`"},
         {"0.23869418806594478`", "0.9242707607811449`", "0.778190081222919`",
           "0.8899102053599937`"},
         {"0.33074825675936337`", "0.9072774843200866`", 
          "0.21041969170902508`", "0.4098646636606518`"},
         {"0.6502257044662783`", "0.5830268971224459`", "0.8546568969093058`",
           "0.8616629380231542`"}
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
             {"0.263468854734886`", "0.4764418137534083`", 
              "0.31352649542897204`", "0.5460783285641142`"},
             {"0.23869418806594478`", "0.9242707607811449`", 
              "0.778190081222919`", "0.8899102053599937`"},
             {"0.33074825675936337`", "0.9072774843200866`", 
              "0.21041969170902508`", "0.4098646636606518`"},
             {"0.6502257044662783`", "0.5830268971224459`", 
              "0.8546568969093058`", "0.8616629380231542`"}
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
             {"0.04658578319949231`", "0", "0", "0"},
             {"0", "0.04658578319949231`", "0", "0"},
             {"0", "0", "0.04658578319949231`", "0"},
             {"0", "0", "0", "0.04658578319949231`"}
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
}, Open  ]],

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
         {"0.16336488456053888`", "0.4391058745518879`", 
          "0.041491699429261786`", "0.9210465209927932`"},
         {"0.14583281247345803`", "0.177603498080803`", "0.6364902305945308`",
           "0.5380473661959981`"},
         {"0.8491356888644697`", "0.05673907382747134`", 
          "0.9117066632957795`", "0.7700352773555961`"},
         {"0.2723387714354426`", "0.9328036136008688`", "0.378564933292594`", 
          "0.7446439140782601`"}
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
             {"0.16336488456053888`", "0.4391058745518879`", 
              "0.041491699429261786`", "0.9210465209927932`"},
             {"0.14583281247345803`", "0.177603498080803`", 
              "0.6364902305945308`", "0.5380473661959981`"},
             {"0.8491356888644697`", "0.05673907382747134`", 
              "0.9117066632957795`", "0.7700352773555961`"},
             {"0.2723387714354426`", "0.9328036136008688`", 
              "0.378564933292594`", "0.7446439140782601`"}
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
             {"1.9973189600153816`", "0", "0", "0"},
             {"0", "1.9973189600153816`", "0", "0"},
             {"0", "0", "1.9973189600153816`", "0"},
             {"0", "0", "0", "1.9973189600153816`"}
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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
         {"0.4654048803537183`", "0.3552563625971379`", "0.7454979630723062`",
           "0.8870758487840986`"},
         {"0.8245299960990462`", "0.2300536642220843`", "0.5473532580893727`",
           "0.003842059132193265`"},
         {"0.628730578398617`", "0.16599592893274284`", "0.6591636020751044`",
           "0.4102936607375629`"},
         {"0.7969152666250512`", "0.7644833649014731`", 
          "0.21834395256996997`", "0.9465455450714773`"}
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
             {"0.4654048803537183`", "0.3552563625971379`", 
              "0.7454979630723062`", "0.8870758487840986`"},
             {"0.8245299960990462`", "0.2300536642220843`", 
              "0.5473532580893727`", "0.003842059132193265`"},
             {"0.628730578398617`", "0.16599592893274284`", 
              "0.6591636020751044`", "0.4102936607375629`"},
             {"0.7969152666250512`", "0.7644833649014731`", 
              "0.21834395256996997`", "0.9465455450714773`"}
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
             {"0.4654048803537183`", "0.3552563625971379`", 
              "0.7454979630723062`", "0.8870758487840986`"},
             {"0.8245299960990462`", "0.2300536642220843`", 
              "0.5473532580893727`", "0.003842059132193265`"},
             {"0.628730578398617`", "0.16599592893274284`", 
              "0.6591636020751044`", "0.4102936607375629`"},
             {"0.7969152666250512`", "0.7644833649014731`", 
              "0.21834395256996997`", "0.9465455450714773`"}
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
             {"0.4654048803537183`", "0.3552563625971379`", 
              "0.7454979630723062`", "0.8870758487840986`"},
             {"0.8245299960990462`", "0.2300536642220843`", 
              "0.5473532580893727`", "0.003842059132193265`"},
             {"0.628730578398617`", "0.16599592893274284`", 
              "0.6591636020751044`", "0.4102936607375629`"},
             {"0.7969152666250512`", "0.7644833649014731`", 
              "0.21834395256996997`", "0.9465455450714773`"}
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
             {"0.4654048803537183`", "0.3552563625971379`", 
              "0.7454979630723062`", "0.8870758487840986`"},
             {"0.8245299960990462`", "0.2300536642220843`", 
              "0.5473532580893727`", "0.003842059132193265`"},
             {"0.628730578398617`", "0.16599592893274284`", 
              "0.6591636020751044`", "0.4102936607375629`"},
             {"0.7969152666250512`", "0.7644833649014731`", 
              "0.21834395256996997`", "0.9465455450714773`"}
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
              RowBox[{"-", "3.755064564926993`"}], 
              RowBox[{"-", "1.96700465091123`"}], "5.5018720583796`", 
              "1.1422600975105557`"},
             {"5.307531306205131`", "5.3639256067237415`", 
              RowBox[{"-", "10.277601067273954`"}], 
              RowBox[{"-", "0.5408686300784775`"}]},
             {"3.439310054672185`", "2.558517775685062`", 
              RowBox[{"-", "4.000523177544825`"}], 
              RowBox[{"-", "1.4995259029796042`"}]},
             {
              RowBox[{"-", "1.9185592011297916`"}], 
              RowBox[{"-", "3.2663327834962628`"}], "4.591452861667415`", 
              "0.8775203444691725`"}
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
             {"0", "1.0000000000000009`", "0", "0"},
             {"0", "0", "1.`", "0"},
             {"0", "0", "0", "1.0000000000000002`"}
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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

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
}, Open  ]],

Cell["ran", "Subsubsection"]
}, Closed]],

Cell[CellGroupData[{

Cell["Church Booleans", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"churchTrue", "=", 
   RowBox[{"x", "\[Function]", 
    RowBox[{"y", "\[Function]", "x"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"churchFalse", "=", 
   RowBox[{"x", "\[Function]", 
    RowBox[{"y", "\[Function]", "y"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"churchIf", "=", 
   RowBox[{"p", "\[Function]", 
    RowBox[{"x", "\[Function]", 
     RowBox[{"y", "\[Function]", 
      RowBox[{
       RowBox[{"p", "[", "x", "]"}], "[", "y", "]"}]}]}]}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"churchIf", "[", "churchTrue", "]"}], "[", "a", "]"}], "[", "b", 
  "]"}]], "Input"],

Cell[BoxData["a"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"churchIf", "[", "churchFalse", "]"}], "[", "a", "]"}], "[", "b", 
  "]"}]], "Input"],

Cell[BoxData["b"], "Output"]
}, Open  ]],

Cell[BoxData["churchApply"], "Input"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["RANDOM INSTRUCTION STRING", "Section"],

Cell[CellGroupData[{

Cell["Frequentized instructions", "Subsection"],

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
}, Closed]],

Cell[CellGroupData[{

Cell["Method of aliases", "Subsection"],

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

Cell[CellGroupData[{

Cell["Unit Test", "Subsubsection"],

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
    RowBox[{"\<\"A\"\>", ",", "18057"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"B\"\>", ",", "12883"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"C\"\>", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"D\"\>", ",", "28188"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"E\"\>", ",", "7689"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\<\"F\"\>", ",", "33183"}], "}"}]}], "}"}]], "Output"]
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
            18057.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{43.157929775541085`, 
           104.87774591682364`}, {-16.218111491126464`, 120.22201186214416`}}],
         StatusArea[#, 18057]& ,
         TagBoxNote->"18057"],
        StyleBox["18057", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[18057, {
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
            12883.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{110.36222753095188`, 172.08204367223445`}, {
           22.697956971509768`, 120.22201186214416`}}],
         StatusArea[#, 12883]& ,
         TagBoxNote->"12883"],
        StyleBox["12883", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[12883, {
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
            28188.}, "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{244.77082304177353`, 
           306.49063918305603`}, {-92.41809015269727, 120.22201186214416`}}],
         StatusArea[#, 28188]& ,
         TagBoxNote->"28188"],
        StyleBox["28188", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[28188, {
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
           
           RectangleBox[{4.545454545454545, 0.}, {5.454545454545454, 7689.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{311.9751207971843, 373.6949369384668}, {
           61.76445476720603, 120.22201186214416`}}],
         StatusArea[#, 7689]& ,
         TagBoxNote->"7689"],
        StyleBox["7689", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[7689, {
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
           
           RectangleBox[{5.545454545454545, 0.}, {6.454545454545454, 33183.}, 
            "RoundingRadius" -> 0]},
          
          ImageSizeCache->{{379.17941855259505`, 
           440.89923469387764`}, {-129.98781608444602`, 120.22201186214414`}}],
         StatusArea[#, 33183]& ,
         TagBoxNote->"33183"],
        StyleBox["33183", {
          GrayLevel[0]}, StripOnInput -> False]],
       Annotation[#, 
        Style[33183, {
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
}, Open  ]]
}, Closed]],

Cell[CellGroupData[{

Cell["Frequentized Random Instruction Strings", "Subsection"],

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
}, Closed]],

Cell[CellGroupData[{

Cell["Frequentized Random Instruction Combinations", "Subsection"],

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
}, Closed]]
}, Closed]],

Cell[CellGroupData[{

Cell["MONTE-CARLO SEARCH", "Section"],

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
      Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {29., {1., 11.}}, 
    Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = True}, 
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
     ImageSizeCache->{99., {61., 68.}},
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
  ImageSizeCache->{1042.2515869140625`, {151., 12.2509765625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "[", 
  RowBox[{"pretty", "@", "lastgood"}], "]"}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`pretty[$CellContext`lastgood], StandardForm],
  ImageSizeCache->{1017., {190.9375, 198.0625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"count", "=", "0"}], ";", 
  RowBox[{"Do", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"count", "++"}], ";", 
     RowBox[{"trial", "[", "]"}]}], ",", 
    RowBox[{"{", "100000000", "}"}]}], "]"}]}]], "Input"],

Cell[BoxData["$Aborted"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["GENETIC SEARCH", "Section"],

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
}, Open  ]],

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
  ImageSizeCache->{1102., {58.9375, 66.0625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "@", 
  RowBox[{"combos", "[", 
   RowBox[{"u4d", ",", "p"}], "]"}]}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`combos[$CellContext`u4d, $CellContext`p], StandardForm],
  ImageSizeCache->{1102., {58.9375, 66.0625}}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dynamic", "@", 
  RowBox[{"combos", "[", 
   RowBox[{"u4d", ",", "p"}], "]"}]}]], "Input"],

Cell[BoxData[
 DynamicBox[ToBoxes[
   $CellContext`combos[$CellContext`u4d, $CellContext`p], StandardForm],
  ImageSizeCache->{1102., {58.9375, 66.0625}}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1280, 1392},
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
Cell[1668, 46, 733, 13, 127, "Text"],
Cell[CellGroupData[{
Cell[2426, 63, 33, 0, 91, "Section"],
Cell[2462, 65, 451, 20, 59, "Text"],
Cell[CellGroupData[{
Cell[2938, 89, 36, 0, 44, "Subsection"],
Cell[2977, 91, 351, 9, 49, "Input",
 InitializationCell->True],
Cell[3331, 102, 357, 9, 49, "Input",
 InitializationCell->True],
Cell[3691, 113, 1737, 35, 133, "Input",
 InitializationCell->True],
Cell[5431, 150, 725, 22, 115, "Input",
 InitializationCell->True]
}, Open  ]],
Cell[CellGroupData[{
Cell[6193, 177, 77, 2, 44, "Subsection"],
Cell[6273, 181, 71, 2, 36, "Text"],
Cell[CellGroupData[{
Cell[6369, 187, 437, 13, 91, "Input"],
Cell[6809, 202, 1983, 48, 113, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[8841, 256, 62, 0, 44, "Subsection"],
Cell[8906, 258, 157, 5, 36, "Text"],
Cell[CellGroupData[{
Cell[9088, 267, 353, 12, 48, "Input"],
Cell[9444, 281, 530, 12, 123, "Output"]
}, Open  ]],
Cell[9989, 296, 61, 0, 36, "Text"],
Cell[CellGroupData[{
Cell[10075, 300, 340, 10, 48, "Input"],
Cell[10418, 312, 2929, 76, 125, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[13396, 394, 43, 0, 44, "Subsection"],
Cell[13442, 396, 57, 0, 36, "Text"],
Cell[13502, 398, 292, 5, 59, "Text"],
Cell[13797, 405, 315, 7, 59, "Text"],
Cell[14115, 414, 155, 5, 36, "Text"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[14319, 425, 34, 0, 91, "Section"],
Cell[14356, 427, 882, 29, 115, "Input"],
Cell[15241, 458, 274, 8, 115, "Input"],
Cell[15518, 468, 28, 0, 36, "Text"],
Cell[15549, 470, 223, 6, 70, "Input"],
Cell[15775, 478, 374, 13, 40, "Text"],
Cell[CellGroupData[{
Cell[16174, 495, 975, 29, 154, "Input"],
Cell[17152, 526, 4908, 123, 205, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22097, 654, 84, 2, 48, "Input"],
Cell[22184, 658, 4622, 121, 205, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[26855, 785, 28, 0, 91, "Section"],
Cell[26886, 787, 155, 5, 49, "Input"],
Cell[27044, 794, 217, 4, 59, "Text"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27298, 803, 31, 0, 91, "Section"],
Cell[27332, 805, 113, 3, 36, "Text"],
Cell[CellGroupData[{
Cell[27470, 812, 40, 0, 44, "Subsection"],
Cell[27513, 814, 107, 3, 36, "Text"],
Cell[27623, 819, 854, 23, 154, "Input"],
Cell[CellGroupData[{
Cell[28502, 846, 255, 9, 49, "Input"],
Cell[28760, 857, 3010, 82, 115, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[31819, 945, 41, 0, 44, "Subsection"],
Cell[31863, 947, 88, 2, 36, "Text"],
Cell[31954, 951, 867, 25, 154, "Input"],
Cell[CellGroupData[{
Cell[32846, 980, 256, 9, 49, "Input"],
Cell[33105, 991, 3189, 82, 115, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[36343, 1079, 41, 0, 44, "Subsection"],
Cell[36387, 1081, 96, 2, 36, "Text"],
Cell[36486, 1085, 190, 6, 49, "Input"],
Cell[CellGroupData[{
Cell[36701, 1095, 80, 2, 48, "Input"],
Cell[36784, 1099, 659, 19, 129, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[37492, 1124, 40, 0, 44, "Subsection"],
Cell[37535, 1126, 95, 2, 36, "Text"],
Cell[37633, 1130, 134, 4, 49, "Input"],
Cell[CellGroupData[{
Cell[37792, 1138, 79, 2, 48, "Input"],
Cell[37874, 1142, 852, 21, 127, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[38775, 1169, 40, 0, 44, "Subsection"],
Cell[38818, 1171, 231, 7, 49, "Input"],
Cell[CellGroupData[{
Cell[39074, 1182, 305, 10, 48, "Input"],
Cell[39382, 1194, 1674, 44, 115, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41093, 1243, 298, 9, 49, "Input"],
Cell[41394, 1254, 12288, 313, 383, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[53731, 1573, 30, 0, 44, "Subsection"],
Cell[53764, 1575, 473, 15, 115, "Input"],
Cell[54240, 1592, 66, 0, 36, "Text"],
Cell[CellGroupData[{
Cell[54331, 1596, 83, 2, 48, "Input"],
Cell[54417, 1600, 31, 0, 48, "Output"]
}, Open  ]],
Cell[54463, 1603, 50, 0, 36, "Text"],
Cell[CellGroupData[{
Cell[54538, 1607, 94, 2, 48, "Input"],
Cell[54635, 1611, 31, 0, 48, "Output"]
}, Open  ]],
Cell[54681, 1614, 75, 0, 36, "Text"],
Cell[54759, 1616, 150, 4, 49, "Input"],
Cell[54912, 1622, 64, 0, 36, "Text"],
Cell[54979, 1624, 150, 4, 49, "Input"],
Cell[55132, 1630, 94, 2, 36, "Text"],
Cell[CellGroupData[{
Cell[55251, 1636, 197, 7, 49, "Input"],
Cell[55451, 1645, 108, 2, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[55596, 1652, 197, 7, 49, "Input"],
Cell[55796, 1661, 106, 2, 48, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[55963, 1670, 47, 0, 91, "Section"],
Cell[CellGroupData[{
Cell[56035, 1674, 27, 0, 44, "Subsection"],
Cell[56065, 1676, 3038, 100, 261, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[59140, 1781, 26, 0, 33, "Subsection"],
Cell[59169, 1783, 282, 5, 59, "Text"],
Cell[59454, 1790, 21542, 593, 2023, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[81033, 2388, 32, 0, 33, "Subsection"],
Cell[81068, 2390, 1576, 55, 154, "Input"],
Cell[CellGroupData[{
Cell[82669, 2449, 30, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[82724, 2453, 161, 5, 48, "Input"],
Cell[82888, 2460, 659, 19, 129, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[83584, 2484, 185, 6, 49, "Input"],
Cell[83772, 2492, 8661, 223, 467, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[92470, 2720, 185, 6, 49, "Input"],
Cell[92658, 2728, 8661, 223, 467, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[101356, 2956, 185, 6, 49, "Input"],
Cell[101544, 2964, 8661, 223, 467, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[110254, 3193, 31, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[110310, 3197, 223, 7, 49, "Input"],
Cell[110536, 3206, 11348, 269, 459, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[121933, 3481, 29, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[121987, 3485, 94, 2, 48, "Input"],
Cell[122084, 3489, 1785, 42, 123, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[123906, 3536, 93, 2, 48, "Input"],
Cell[124002, 3540, 1132, 28, 123, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[125171, 3573, 107, 3, 48, "Input"],
Cell[125281, 3578, 936, 26, 125, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126254, 3609, 121, 3, 48, "Input"],
Cell[126378, 3614, 4568, 109, 231, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[130983, 3728, 151, 4, 48, "Input"],
Cell[131137, 3734, 4225, 97, 235, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[135411, 3837, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[135464, 3841, 120, 3, 48, "Input"],
Cell[135587, 3846, 8574, 193, 233, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[144198, 4044, 150, 4, 48, "Input"],
Cell[144351, 4050, 4236, 97, 235, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[148636, 4153, 30, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[148691, 4157, 122, 3, 48, "Input"],
Cell[148816, 4162, 4569, 109, 231, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[153434, 4277, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[153487, 4281, 497, 15, 70, "Input"],
Cell[153987, 4298, 18108, 418, 779, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[172132, 4721, 120, 3, 48, "Input"],
Cell[172255, 4726, 291142, 6033, 289, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[463446, 10765, 29, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[463500, 10769, 170, 5, 49, "Input"],
Cell[463673, 10776, 5733, 150, 367, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[469443, 10931, 170, 5, 49, "Input"],
Cell[469616, 10938, 5821, 150, 367, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[475474, 11093, 170, 5, 49, "Input"],
Cell[475647, 11100, 5733, 150, 367, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[481417, 11255, 170, 5, 49, "Input"],
Cell[481590, 11262, 5821, 150, 367, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[487460, 11418, 30, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[487515, 11422, 221, 7, 49, "Input"],
Cell[487739, 11431, 6575, 168, 365, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[494363, 11605, 29, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[494417, 11609, 170, 5, 48, "Input"],
Cell[494590, 11616, 6930, 176, 371, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[501557, 11797, 126, 4, 48, "Input"],
Cell[501686, 11803, 540, 17, 67, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[502263, 11825, 178, 5, 48, "Input"],
Cell[502444, 11832, 10914, 252, 379, "Output"]
}, Open  ]]
}, Open  ]],
Cell[513385, 12088, 30, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[513440, 12092, 31, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[513496, 12096, 161, 5, 48, "Input"],
Cell[513660, 12103, 4477, 115, 263, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[518186, 12224, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[518239, 12228, 92, 2, 48, "Input"],
Cell[518334, 12232, 63570, 1443, 173, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[581941, 13680, 349, 11, 70, "Input"],
Cell[582293, 13693, 10548, 247, 467, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[592878, 13945, 106, 3, 48, "Input"],
Cell[592987, 13950, 976, 26, 125, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[594012, 13982, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[594065, 13986, 189, 6, 48, "Input"],
Cell[594257, 13994, 4165, 103, 267, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[598471, 14103, 27, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[598523, 14107, 188, 6, 48, "Input"],
Cell[598714, 14115, 4162, 103, 267, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[602925, 14224, 26, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[602976, 14228, 156, 5, 48, "Input"],
Cell[603135, 14235, 4030, 101, 263, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[607214, 14342, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[607267, 14346, 158, 5, 48, "Input"],
Cell[607428, 14353, 3815, 99, 265, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[611292, 14458, 27, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[611344, 14462, 157, 5, 48, "Input"],
Cell[611504, 14469, 4023, 101, 263, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[615576, 14576, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[615629, 14580, 259, 8, 49, "Input"],
Cell[615891, 14590, 9567, 227, 467, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[625507, 14823, 29, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[625561, 14827, 169, 5, 48, "Input"],
Cell[625733, 14834, 8188, 196, 361, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[633958, 15035, 159, 5, 48, "Input"],
Cell[634120, 15042, 4025, 101, 263, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[638182, 15148, 134, 4, 48, "Input"],
Cell[638319, 15154, 935, 31, 99, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[639303, 15191, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[639356, 15195, 168, 5, 48, "Input"],
Cell[639527, 15202, 8187, 196, 361, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[647751, 15403, 158, 5, 48, "Input"],
Cell[647912, 15410, 4024, 101, 263, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[651973, 15516, 133, 4, 48, "Input"],
Cell[652109, 15522, 934, 31, 99, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[653092, 15559, 28, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[653145, 15563, 114, 3, 49, "Input"],
Cell[653262, 15568, 1137, 28, 123, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[654436, 15601, 143, 4, 49, "Input"],
Cell[654582, 15607, 284, 9, 57, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[654903, 15621, 177, 6, 49, "Input"],
Cell[655083, 15629, 284, 9, 57, "Output"]
}, Open  ]]
}, Open  ]],
Cell[655394, 15642, 29, 0, 31, "Subsubsection"],
Cell[655426, 15644, 30, 0, 22, "Subsubsection"],
Cell[655459, 15646, 27, 0, 22, "Subsubsection"],
Cell[655489, 15648, 27, 0, 22, "Subsubsection"],
Cell[655519, 15650, 27, 0, 22, "Subsubsection"],
Cell[655549, 15652, 27, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[655601, 15656, 29, 0, 22, "Subsubsection"],
Cell[CellGroupData[{
Cell[655655, 15660, 62, 1, 49, "Input"],
Cell[655720, 15663, 1137, 28, 123, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[656894, 15696, 63, 1, 49, "Input"],
Cell[656960, 15699, 2045, 49, 123, "Output"]
}, Open  ]]
}, Open  ]],
Cell[659032, 15752, 28, 0, 31, "Subsubsection"]
}, Closed]],
Cell[CellGroupData[{
Cell[659097, 15757, 37, 0, 33, "Subsection"],
Cell[659137, 15759, 539, 15, 91, "Input"],
Cell[CellGroupData[{
Cell[659701, 15778, 130, 4, 48, "Input"],
Cell[659834, 15784, 28, 0, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[659899, 15789, 131, 4, 48, "Input"],
Cell[660033, 15795, 28, 0, 48, "Output"]
}, Open  ]],
Cell[660076, 15798, 37, 0, 49, "Input"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[660162, 15804, 44, 0, 91, "Section"],
Cell[CellGroupData[{
Cell[660231, 15808, 47, 0, 44, "Subsection"],
Cell[660281, 15810, 150, 4, 48, "Input"],
Cell[CellGroupData[{
Cell[660456, 15818, 40, 0, 48, "Input"],
Cell[660499, 15820, 432, 8, 70, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[660968, 15833, 5722, 145, 637, "Input"],
Cell[666693, 15980, 3829, 99, 657, "Output"]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[670571, 16085, 39, 0, 33, "Subsection"],
Cell[670613, 16087, 94, 2, 36, "Text"],
Cell[670710, 16091, 144, 3, 36, "Text"],
Cell[670857, 16096, 8321, 202, 1099, "Input"],
Cell[679181, 16300, 2677, 69, 343, "Input"],
Cell[CellGroupData[{
Cell[681883, 16373, 34, 0, 31, "Subsubsection"],
Cell[CellGroupData[{
Cell[681942, 16377, 1539, 37, 196, "Input"],
Cell[683484, 16416, 2045, 45, 173, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[685566, 16466, 439, 14, 70, "Input"],
Cell[686008, 16482, 7682, 194, 315, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[693727, 16681, 540, 16, 49, "Input"],
Cell[694270, 16699, 474, 14, 48, "Output"]
}, Open  ]],
Cell[694759, 16716, 122, 3, 36, "Text"],
Cell[CellGroupData[{
Cell[694906, 16723, 385, 11, 49, "Input"],
Cell[695294, 16736, 5649, 152, 295, "Output"]
}, Open  ]]
}, Open  ]]
}, Closed]],
Cell[CellGroupData[{
Cell[701004, 16895, 61, 0, 33, "Subsection"],
Cell[CellGroupData[{
Cell[701090, 16899, 153, 4, 48, "Input"],
Cell[701246, 16905, 8198, 171, 616, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[709481, 17081, 126, 2, 49, "Input"],
Cell[709610, 17085, 29, 0, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[709676, 17090, 458, 12, 91, "Input"],
Cell[710137, 17104, 31, 0, 48, "Output"]
}, Open  ]],
Cell[710183, 17107, 533, 12, 154, "Input"],
Cell[710719, 17121, 304, 10, 70, "Input"]
}, Closed]],
Cell[CellGroupData[{
Cell[711060, 17136, 66, 0, 33, "Subsection"],
Cell[711129, 17138, 521, 8, 105, "Text"],
Cell[CellGroupData[{
Cell[711675, 17150, 186, 6, 48, "Input"],
Cell[711864, 17158, 8849, 227, 473, "Output"]
}, Open  ]],
Cell[720728, 17388, 10283, 257, 868, "Input"],
Cell[731014, 17647, 189, 5, 48, "Input"],
Cell[CellGroupData[{
Cell[731228, 17656, 148, 2, 49, "Input"],
Cell[731379, 17660, 29, 0, 48, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[731445, 17665, 495, 13, 91, "Input"],
Cell[731943, 17680, 31, 0, 48, "Output"]
}, Open  ]],
Cell[731989, 17683, 588, 12, 154, "Input"],
Cell[732580, 17697, 304, 10, 70, "Input"]
}, Closed]]
}, Closed]],
Cell[CellGroupData[{
Cell[732933, 17713, 37, 0, 53, "Section"],
Cell[732973, 17715, 853, 25, 154, "Input"],
Cell[733829, 17742, 6859, 163, 511, "Input"],
Cell[CellGroupData[{
Cell[740713, 17909, 216, 6, 48, "Input"],
Cell[740932, 17917, 1402, 29, 162, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[742371, 17951, 218, 5, 70, "Input"],
Cell[742592, 17958, 270, 5, 196, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[742899, 17968, 95, 2, 49, "Input"],
Cell[742997, 17972, 157, 3, 423, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[743191, 17980, 243, 8, 48, "Input"],
Cell[743437, 17990, 35, 0, 48, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[743521, 17996, 33, 0, 91, "Section"],
Cell[743557, 17998, 16217, 417, 1729, "Input"],
Cell[759777, 18417, 62, 1, 48, "Input"],
Cell[CellGroupData[{
Cell[759864, 18422, 171, 6, 49, "Input"],
Cell[760038, 18430, 434, 9, 29, "Message"],
Cell[760475, 18441, 112, 2, 49, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[760636, 18449, 35, 0, 91, "Section"],
Cell[CellGroupData[{
Cell[760696, 18453, 2020, 63, 175, "Input"],
Cell[762719, 18518, 434, 9, 29, "Message"],
Cell[763156, 18529, 112, 2, 49, "Output"],
Cell[763271, 18533, 434, 9, 29, "Message"],
Cell[763708, 18544, 112, 2, 49, "Output"],
Cell[763823, 18548, 434, 9, 29, "Message"],
Cell[764260, 18559, 112, 2, 49, "Output"],
Cell[764375, 18563, 434, 9, 29, "Message"],
Cell[764812, 18574, 112, 2, 49, "Output"],
Cell[764927, 18578, 464, 9, 29, "Message"],
Cell[765394, 18589, 464, 9, 29, "Message"],
Cell[765861, 18600, 464, 9, 29, "Message"],
Cell[766328, 18611, 486, 10, 29, "Message"],
Cell[766817, 18623, 498, 16, 93, "Output"]
}, Open  ]],
Cell[767330, 18642, 257, 8, 49, "Input"],
Cell[CellGroupData[{
Cell[767612, 18654, 398, 12, 48, "Input"],
Cell[768013, 18668, 3454, 98, 115, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[771504, 18771, 347, 11, 48, "Input"],
Cell[771854, 18784, 1011, 31, 115, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[772914, 18821, 26, 0, 91, "Section"],
Cell[772943, 18823, 43, 0, 36, "Text"],
Cell[772989, 18825, 14118, 340, 469, "Input"],
Cell[CellGroupData[{
Cell[787132, 19169, 47, 0, 44, "Subsection"],
Cell[787182, 19171, 670, 22, 115, "Input"],
Cell[CellGroupData[{
Cell[787877, 19197, 114, 3, 49, "Input"],
Cell[787994, 19202, 166, 3, 159, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[788197, 19210, 114, 3, 49, "Input"],
Cell[788314, 19215, 166, 3, 159, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[788517, 19223, 114, 3, 49, "Input"],
Cell[788634, 19228, 166, 3, 159, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature kvT7ZEjh7gl3KB1UV6N8qTp@ *)
