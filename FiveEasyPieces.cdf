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
NotebookDataLength[     18674,        680]
NotebookOptionsPosition[     16962,        601]
NotebookOutlinePosition[     17488,        620]
CellTagsIndexPosition[     17445,        617]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Five Easy Pieces", "Title"],

Cell["\<\
Programming with Patterns and Rules\
\>", "Subtitle"],

Cell["Brian Beckman and David Leibs", "Author"],

Cell["10 December 2012", "Date"],

Cell[CellGroupData[{

Cell["\<\
Etude 1: Functions are Lists of Rules\
\>", "Section"],

Cell["We're very accustomed writing:", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"square", "[", "x_", "]"}], ":=", 
   RowBox[{"x", "*", "x"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"square", "[", "42", "]"}]}], "Input"],

Cell[BoxData["1764"], "Output"]
}, Open  ]],

Cell[TextData[{
 "But we can write the same thing this way, with ",
 StyleBox["square", "Input"],
 " as a list of rules:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "square", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"square", "=", 
   RowBox[{"{", 
    RowBox[{"x_", "\[RuleDelayed]", 
     RowBox[{"x", "*", "x"}]}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"42", "/.", "square"}]}], "Input"],

Cell[BoxData["1764"], "Output"]
}, Open  ]],

Cell[TextData[{
 "That ",
 StyleBox["/.", "Input"],
 " thing is just syntax for ",
 StyleBox["ReplaceAll", "Input"],
 ":"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ReplaceAll", "[", 
  RowBox[{"42", ",", "square"}], "]"}]], "Input"],

Cell[BoxData["1764"], "Output"]
}, Open  ]],

Cell[TextData[{
 "There are two kinds of rules: one where the right-hand side is evaluated at \
definition time, another where the right-hand side is evaluated at \
application time. The first kind uses a ",
 StyleBox["->", "Input"],
 " arrow, like this:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "myRules", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"myRules", "=", 
   RowBox[{"{", 
    RowBox[{"bar", "\[Rule]", "\"\<Cocktail Time!\>\""}], "}"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"bar", "/.", "myRules"}]}], "Input"],

Cell[BoxData["\<\"Cocktail Time!\"\>"], "Output"]
}, Open  ]],

Cell[TextData[{
 "It's ok to evaluate ",
 StyleBox["\"Cocktail Time!\"", "Input"],
 " when ",
 StyleBox["myRules", "Input"],
 " is defined because it doesn't depend on inputs that change at application \
time. But the second kind uses the ",
 StyleBox[":>", "Input"],
 " arrow:"
}], "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "myRules", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"myRules", "=", 
   RowBox[{"{", 
    RowBox[{"x_", "\[RuleDelayed]", 
     RowBox[{"x", "*", "x"}]}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"42", "/.", "myRules"}]}], "Input"],

Cell[BoxData["1764"], "Output"]
}, Open  ]]
}, Open  ]],

Cell["Etude 2: Objects are Lists of Rules", "Section"],

Cell["\<\
Etude 3: Transforms are Lists of Rules\
\>", "Section"],

Cell["Etude 4: Units of Measure", "Section"],

Cell[CellGroupData[{

Cell["Etude 5: A Forth Interpreter", "Section"],

Cell["\<\
Just like an HP (RPN) calculator\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"ClearAll", "[", 
    RowBox[{
    "push", ",", "pop", ",", "dup", ",", "swap", ",", "rot", ",", "top", ",", 
     "next"}], "]"}], ";"}], "\n", 
  RowBox[{"(*", " ", 
   RowBox[{"stack", "-", "to", "-", 
    RowBox[{"stack", " ", "transforms"}]}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"push", "[", 
    RowBox[{"stack_", ",", "datum_"}], "]"}], ":=", 
   RowBox[{"Append", "[", 
    RowBox[{"stack", ",", "datum"}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"pop", "[", "stack_", "]"}], ":=", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"stack", "===", 
      RowBox[{"{", "}"}]}], ",", 
     RowBox[{"{", "}"}], ",", 
     RowBox[{"Drop", "[", 
      RowBox[{"stack", ",", 
       RowBox[{"-", "1"}]}], "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"dup", "[", "stack_", "]"}], ":=", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"stack", "=!=", 
      RowBox[{"{", "}"}]}], ",", 
     RowBox[{"push", "[", 
      RowBox[{"Last", "@", "stack"}], "]"}], ",", "stack"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"rot", "[", "stack_", "]"}], ":=", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"stack", "===", 
      RowBox[{"{", "}"}]}], ",", 
     RowBox[{"{", "}"}], ",", 
     RowBox[{"With", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"t", "=", 
         RowBox[{"top", "[", "stack", "]"}]}], "}"}], ",", 
       RowBox[{"Prepend", "[", 
        RowBox[{
         RowBox[{"pop", "[", "stack", "]"}], ",", "t"}], "]"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"swap", "[", "stack_", "]"}], ":=", "\[IndentingNewLine]", 
    RowBox[{"If", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"Length", "[", "stack", "]"}], "<", "2"}], ",", 
      "\[IndentingNewLine]", "stack", ",", "\[IndentingNewLine]", 
      RowBox[{"With", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"a", "=", 
           RowBox[{"top", "[", "stack", "]"}]}], ",", 
          RowBox[{"b", "=", 
           RowBox[{"next", "[", "stack", "]"}]}]}], "}"}], ",", 
        "\[IndentingNewLine]", 
        RowBox[{"push", "[", 
         RowBox[{
          RowBox[{"push", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "//", "pop"}], "//", "pop"}], ",", "a"}], "]"}],
           ",", "b"}], "]"}]}], "]"}]}], "]"}]}], ";"}], 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{"stack", "-", "to", "-", 
    RowBox[{"value", " ", "transforms"}]}], " ", 
   "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"top", "[", "stack_", "]"}], ":=", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"stack", "===", 
      RowBox[{"{", "}"}]}], ",", "0", ",", 
     RowBox[{"Last", "@", "stack"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"next", "[", "stack_", "]"}], ":=", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"Length", "@", "stack"}], "<", "2"}], ",", "0", ",", 
     RowBox[{"stack", "\[LeftDoubleBracket]", 
      RowBox[{"-", "2"}], "\[RightDoubleBracket]"}]}], "]"}]}], 
  ";"}]}], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"instructionSet", "=", 
   RowBox[{"{", 
    RowBox[{
    "plus", ",", "times", ",", "minus", ",", "div", ",", "dup", ",", "swap", 
     ",", "pop"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{
   "exec", ",", "execTrace", ",", "execAll", ",", "execAllTrace", ",", 
    "gridStack", ",", "plus", ",", "times", ",", "minus", ",", "div"}], "]"}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exec", "[", 
    RowBox[{"stack_", ",", "instr_"}], "]"}], ":=", "\[IndentingNewLine]", 
   RowBox[{"instr", "/.", 
    RowBox[{"Dispatch", "@", 
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "BINARIES", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"plus", "\[RuleDelayed]", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{
             RowBox[{"next", "[", "stack", "]"}], "+", 
             RowBox[{"top", "[", "stack", "]"}]}]}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"push", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "//", "pop"}], "//", "pop"}], ",", "r"}], 
           "]"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"times", "\[RuleDelayed]", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{
             RowBox[{"next", "[", "stack", "]"}], "*", 
             RowBox[{"top", "[", "stack", "]"}]}]}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"push", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "//", "pop"}], "//", "pop"}], ",", "r"}], 
           "]"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"minus", "\[RuleDelayed]", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{
             RowBox[{"next", "[", "stack", "]"}], "-", 
             RowBox[{"top", "[", "stack", "]"}]}]}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"push", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "//", "pop"}], "//", "pop"}], ",", "r"}], 
           "]"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"div", "\[RuleDelayed]", 
        RowBox[{"With", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"r", "=", 
            RowBox[{
             RowBox[{"next", "[", "stack", "]"}], "/", 
             RowBox[{"top", "[", "stack", "]"}]}]}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"push", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "//", "pop"}], "//", "pop"}], ",", "r"}], 
           "]"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"(*", " ", "NULLARIES", " ", "*)"}], "\[IndentingNewLine]", 
       RowBox[{"pop", "\[RuleDelayed]", 
        RowBox[{"pop", "[", "stack", "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"dup", "\[RuleDelayed]", 
        RowBox[{"dup", "[", "stack", "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"rot", "\[RuleDelayed]", 
        RowBox[{"rot", "[", "stack", "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"swap", "\[RuleDelayed]", 
        RowBox[{"swap", "[", "stack", "]"}]}], ",", "\[IndentingNewLine]", 
       RowBox[{"(*", " ", 
        RowBox[{
         RowBox[{"UNARY", " ", "--"}], " ", "DEFAULT"}], " ", "*)"}], 
       "\[IndentingNewLine]", 
       RowBox[{"x_", "\[RuleDelayed]", 
        RowBox[{"push", "[", 
         RowBox[{"stack", ",", "instr"}], "]"}]}]}], "\[IndentingNewLine]", 
      "}"}]}]}]}], ";"}], "\[IndentingNewLine]", 
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
    RowBox[{"exec", "[", 
     RowBox[{"stack", ",", "instr"}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execAll", "[", 
    RowBox[{"stack_", ",", "instrs_"}], "]"}], ":=", 
   RowBox[{"gridStack", "@", 
    RowBox[{"Fold", "[", 
     RowBox[{"exec", ",", "stack", ",", "instrs"}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execAllTrace", "[", 
    RowBox[{"stack_", ",", "instrs_"}], "]"}], ":=", 
   RowBox[{"Grid", "[", 
    RowBox[{"FoldList", "[", 
     RowBox[{"exec", ",", "stack", ",", "instrs"}], "]"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"gridStack", "[", "stack_", "]"}], ":=", 
  RowBox[{"Grid", "[", 
   RowBox[{"{", "stack", "}"}], "]"}]}]}], "Input"],

Cell["\<\
Top of stack is displayed on the right, bottom on the left.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b", ",", "minus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"", ""},
    {"a", ""},
    {"a", "b"},
    {
     RowBox[{"a", "-", "b"}], ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b", ",", "times"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"", ""},
    {"a", ""},
    {"a", "b"},
    {
     RowBox[{"a", " ", "b"}], ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b", ",", "div"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"", ""},
    {"a", ""},
    {"a", "b"},
    {
     FractionBox["a", "b"], ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "x", ",", "y", ",", "z", ",", "t", ",", "rot", ",", "rot", ",", "rot"}], 
    "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"", "", "", ""},
    {"x", "", "", ""},
    {"x", "y", "", ""},
    {"x", "y", "z", ""},
    {"x", "y", "z", "t"},
    {"t", "x", "y", "z"},
    {"z", "t", "x", "y"},
    {"y", "z", "t", "x"}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"x", ",", "y", ",", "z", ",", "swap"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"", "", ""},
    {"x", "", ""},
    {"x", "y", ""},
    {"x", "y", "z"},
    {"x", "z", "y"}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
    "a", ",", "b", ",", "3", ",", "4", ",", "plus", ",", "rot", ",", "div", 
     ",", "plus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"", "", "", ""},
    {"a", "", "", ""},
    {"a", "b", "", ""},
    {"a", "b", "3", ""},
    {"a", "b", "3", "4"},
    {"a", "b", "7", ""},
    {"7", "a", "b", ""},
    {"7", 
     FractionBox["b", "a"], "", ""},
    {
     RowBox[{"7", "+", 
      FractionBox["b", "a"]}], "", "", ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", "plus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"3", "4"},
    {"7", ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"{", "}"}], "//", 
     RowBox[{
      RowBox[{"push", "[", 
       RowBox[{"#", ",", "3"}], "]"}], "&"}]}], "//", 
    RowBox[{
     RowBox[{"push", "[", 
      RowBox[{"#", ",", "4"}], "]"}], "&"}]}], ",", 
   RowBox[{"{", "plus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"3", "4"},
    {"7", ""}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1440, 852},
WindowMargins->{{0, Automatic}, {Automatic, 0}},
Magnification:>FEPrivate`If[
  FEPrivate`Equal[FEPrivate`$VersionNumber, 6.], 1.5, 1.5 Inherited],
FrontEndVersion->"9.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (November 20, \
2012)",
StyleDefinitions->FrontEnd`FileName[{"Report"}, "StandardReport.nb", 
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
Cell[1485, 35, 33, 0, 134, "Title"],
Cell[1521, 37, 63, 2, 46, "Subtitle"],
Cell[1587, 41, 47, 0, 59, "Author"],
Cell[1637, 43, 32, 0, 62, "Date"],
Cell[CellGroupData[{
Cell[1694, 47, 64, 2, 122, "Section"],
Cell[1761, 51, 46, 0, 46, "Text"],
Cell[CellGroupData[{
Cell[1832, 55, 190, 5, 83, "Input"],
Cell[2025, 62, 31, 0, 57, "Output"]
}, Open  ]],
Cell[2071, 65, 133, 4, 46, "Text"],
Cell[CellGroupData[{
Cell[2229, 73, 305, 8, 108, "Input"],
Cell[2537, 83, 31, 0, 57, "Output"]
}, Open  ]],
Cell[2583, 86, 133, 6, 46, "Text"],
Cell[CellGroupData[{
Cell[2741, 96, 92, 2, 57, "Input"],
Cell[2836, 100, 31, 0, 57, "Output"]
}, Open  ]],
Cell[2882, 103, 267, 6, 76, "Text"],
Cell[CellGroupData[{
Cell[3174, 113, 301, 8, 108, "Input"],
Cell[3478, 123, 49, 0, 57, "Output"]
}, Open  ]],
Cell[3542, 126, 290, 9, 76, "Text"],
Cell[CellGroupData[{
Cell[3857, 139, 308, 8, 108, "Input"],
Cell[4168, 149, 31, 0, 57, "Output"]
}, Open  ]]
}, Open  ]],
Cell[4226, 153, 54, 0, 122, "Section"],
Cell[4283, 155, 65, 2, 75, "Section"],
Cell[4351, 159, 44, 0, 75, "Section"],
Cell[CellGroupData[{
Cell[4420, 163, 47, 0, 75, "Section"],
Cell[4470, 165, 56, 2, 46, "Text"],
Cell[4529, 169, 3283, 103, 383, "Input"],
Cell[7815, 274, 4896, 128, 683, "Input"],
Cell[12714, 404, 83, 2, 46, "Text"],
Cell[CellGroupData[{
Cell[12822, 410, 170, 5, 57, "Input"],
Cell[12995, 417, 242, 10, 131, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13274, 432, 170, 5, 57, "Input"],
Cell[13447, 439, 242, 10, 131, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13726, 454, 168, 5, 57, "Input"],
Cell[13897, 461, 240, 10, 139, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14174, 476, 222, 7, 57, "Input"],
Cell[14399, 485, 354, 13, 231, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14790, 503, 179, 5, 57, "Input"],
Cell[14972, 510, 255, 10, 155, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15264, 525, 237, 7, 57, "Input"],
Cell[15504, 534, 448, 17, 279, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15989, 556, 164, 5, 57, "Input"],
Cell[16156, 563, 187, 7, 81, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16380, 575, 352, 12, 57, "Input"],
Cell[16735, 589, 187, 7, 81, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature bwDT@jOUMOSZLDwh@tVrbXbD *)
