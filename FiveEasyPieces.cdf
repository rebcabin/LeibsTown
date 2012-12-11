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
NotebookDataLength[     37661,       1388]
NotebookOptionsPosition[     33945,       1240]
NotebookOutlinePosition[     34371,       1257]
CellTagsIndexPosition[     34328,       1254]
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

Cell["\<\
We're very accustomed to writing:\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "square", "]"}], ";"}], "\[IndentingNewLine]", 
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
    "pushR", ",", "popR", ",", "dupR", ",", "swapR", ",", "rotR", ",", "topR",
      ",", "nextR"}], "]"}], ";"}], "\n", 
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
      RowBox[{"{", "}"}], "\[RuleDelayed]", 
      RowBox[{"Throw", "[", "\"\<topR: empty stack\>\"", "]"}]}]}], "}"}]}], 
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
        RowBox[{"{", "a_", "}"}], "|", 
        RowBox[{"{", "}"}]}], ")"}], "\[RuleDelayed]", 
      RowBox[{"Throw", "[", "\"\<nextR: deficient stack\>\"", "]"}]}]}], 
    "}"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell["Toccata", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", "instructionSet", "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"instructionSet", "=", 
   RowBox[{"{", 
    RowBox[{
    "plus", ",", "times", ",", "minus", ",", "div", ",", "pop", ",", "dup", 
     ",", "rot", ",", "swap"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{
   "exec", ",", "execTrace", ",", "execAll", ",", "execAllTrace", ",", 
    "gridStack", ",", "microcode"}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "/@", "instructionSet"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"microcode", "=", 
   RowBox[{"Dispatch", "@", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{"(*", " ", "BINARIES", " ", "*)"}], "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "plus"}], "}"}], "\[RuleDelayed]", 
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
        RowBox[{"stack_", ",", "times"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"stack", "/.", "nextR"}], ")"}], "*", 
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
       RowBox[{"With", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"r", "=", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"stack", "/.", "nextR"}], ")"}], "/", 
            RowBox[{"(", 
             RowBox[{"stack", "/.", "topR"}], ")"}]}]}], "}"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"stack", "/.", "popR"}], "/.", "popR"}], ",", "r"}], 
           "}"}], "/.", "pushR"}]}], "]"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"(*", " ", "NULLARIES", " ", "*)"}], "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "pop"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "popR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "dup"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "dupR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "rot"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "rotR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"stack_", ",", "swap"}], "}"}], "\[RuleDelayed]", 
       RowBox[{"(", 
        RowBox[{"stack", "/.", "swapR"}], ")"}]}], ",", "\[IndentingNewLine]", 
      RowBox[{"(*", " ", 
       RowBox[{
        RowBox[{"UNARY", " ", "--"}], " ", "DEFAULT"}], " ", "*)"}], 
      "\[IndentingNewLine]", 
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
   RowBox[{
    RowBox[{"{", 
     RowBox[{"stack", ",", "instr"}], "}"}], "/.", "microcode"}]}], 
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
   RowBox[{"With", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"history", "=", 
       RowBox[{"FoldList", "[", 
        RowBox[{"exec", ",", "stack", ",", "instrs"}], "]"}]}], "}"}], ",", 
     RowBox[{"Grid", "[", 
      RowBox[{
       RowBox[{"Partition", "[", 
        RowBox[{
         RowBox[{"Join", "[", 
          RowBox[{
           RowBox[{"{", "start", "}"}], ",", 
           RowBox[{"Riffle", "[", 
            RowBox[{"history", ",", "instrs"}], "]"}]}], "]"}], ",", "2"}], 
        "]"}], ",", 
       RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]}], "]"}]}], ";", 
  RowBox[{
   RowBox[{"gridStack", "[", "stack_", "]"}], ":=", 
   RowBox[{"Grid", "[", 
    RowBox[{
     RowBox[{"{", "stack", "}"}], ",", 
     RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]}]}]}], "Input"],

Cell["Top of stack is displayed on the LEFT, bottom on the RIGHT.", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b", ",", "minus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"minus", 
     RowBox[{"{", 
      RowBox[{"a", "-", "b"}], "}"}]}
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
    RowBox[{"a", ",", "b", ",", "times"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"times", 
     RowBox[{"{", 
      RowBox[{"a", " ", "b"}], "}"}]}
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
    RowBox[{"a", ",", "b", ",", "div"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"div", 
     RowBox[{"{", 
      FractionBox["a", "b"], "}"}]}
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
    RowBox[{
    "x", ",", "y", ",", "z", ",", "t", ",", "rot", ",", "rot", ",", "rot"}], 
    "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"x", 
     RowBox[{"{", "x", "}"}]},
    {"y", 
     RowBox[{"{", 
      RowBox[{"y", ",", "x"}], "}"}]},
    {"z", 
     RowBox[{"{", 
      RowBox[{"z", ",", "y", ",", "x"}], "}"}]},
    {"t", 
     RowBox[{"{", 
      RowBox[{"t", ",", "z", ",", "y", ",", "x"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"z", ",", "y", ",", "x", ",", "t"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"y", ",", "x", ",", "t", ",", "z"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"x", ",", "t", ",", "z", ",", "y"}], "}"}]}
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
    RowBox[{"x", ",", "y", ",", "z", ",", "swap"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"x", 
     RowBox[{"{", "x", "}"}]},
    {"y", 
     RowBox[{"{", 
      RowBox[{"y", ",", "x"}], "}"}]},
    {"z", 
     RowBox[{"{", 
      RowBox[{"z", ",", "y", ",", "x"}], "}"}]},
    {"swap", 
     RowBox[{"{", 
      RowBox[{"y", ",", "z", ",", "x"}], "}"}]}
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
   RowBox[{"{", 
    RowBox[{"3", ",", "4"}], "}"}], ",", 
   RowBox[{"{", "plus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", 
      RowBox[{"3", ",", "4"}], "}"}]},
    {"plus", 
     RowBox[{"{", "7", "}"}]}
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
    RowBox[{
    "a", ",", "b", ",", "3", ",", "4", ",", "plus", ",", "rot", ",", "div", 
     ",", "plus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"3", 
     RowBox[{"{", 
      RowBox[{"3", ",", "b", ",", "a"}], "}"}]},
    {"4", 
     RowBox[{"{", 
      RowBox[{"4", ",", "3", ",", "b", ",", "a"}], "}"}]},
    {"plus", 
     RowBox[{"{", 
      RowBox[{"7", ",", "b", ",", "a"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a", ",", "7"}], "}"}]},
    {"div", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["a", "b"], ",", "7"}], "}"}]},
    {"plus", 
     RowBox[{"{", 
      RowBox[{"7", "+", 
       FractionBox["a", "b"]}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell["Expect exceptions from the next two", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "plus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"nextR: deficient \
stack\\\"]\\)\[NoBreak] returned to top level. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", ButtonNote -> \
\\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"nextR: deficient stack\"\>", "]"}], 
  "]"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAllTrace", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "plus", "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"nextR: deficient \
stack\\\"]\\)\[NoBreak] returned to top level. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", ButtonNote -> \
\\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"nextR: deficient stack\"\>", "]"}], 
  "]"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Fugue", "Subsection"],

Cell[TextData[{
 "All rules -- no function notation (except in the argument to ",
 StyleBox["FixedPointList", "Input"],
 ")."
}], "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"exec2", ",", "execAll2", ",", "execAllTrace2"}], "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exec2", "=", 
    RowBox[{
     RowBox[{"instrDispatch", ":", 
      RowBox[{"{", 
       RowBox[{"stack_", ",", "instr_"}], "}"}]}], "\[RuleDelayed]", 
     RowBox[{"(", 
      RowBox[{"instrDispatch", "/.", "microcode"}], ")"}]}]}], ";"}], 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"use", " ", "execAll2", " ", "with"}], " ", "//."}], ",", " ", 
    "ReplaceRepeated"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"execAll2", "=", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"stack_", ",", 
       RowBox[{"{", 
        RowBox[{"instr_", ",", "instrs___"}], "}"}]}], "}"}], 
     "\[RuleDelayed]", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{"stack", ",", "instr"}], "}"}], "/.", "exec2"}], ",", 
       RowBox[{"{", "instrs", "}"}]}], "}"}]}]}], ";"}], 
  "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"use", " ", "execAllTrace2", " ", "with"}], " ", "/.", " ", 
    "ReplaceAll"}], " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"execAllTrace2", "=", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"stack_", ",", 
      RowBox[{"{", "instrs__", "}"}]}], "}"}], "\[RuleDelayed]", 
    "\[IndentingNewLine]", 
    RowBox[{"With", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"history", "=", 
        RowBox[{"Most", "@", 
         RowBox[{"FixedPointList", "[", 
          RowBox[{
           RowBox[{"x", "\[Function]", 
            RowBox[{"x", "/.", "execAll2"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"stack", ",", 
             RowBox[{"{", "instrs", "}"}]}], "}"}]}], "]"}]}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"With", "[", 
       RowBox[{
        RowBox[{"{", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"stacks", "=", 
           RowBox[{"First", "/@", "history"}]}], ",", "\[IndentingNewLine]", 
          RowBox[{"instrs2", "=", 
           RowBox[{"Prepend", "[", 
            RowBox[{
             RowBox[{"First", "/@", 
              RowBox[{"Most", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{
                 "#", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
                 "&"}], "/@", "history"}], "]"}]}], ",", "start"}], "]"}]}]}],
          "}"}], ",", "\[IndentingNewLine]", 
        RowBox[{"Grid", "[", 
         RowBox[{
          RowBox[{"Transpose", "@", 
           RowBox[{"{", 
            RowBox[{"instrs2", ",", "stacks"}], "}"}]}], ",", 
          RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]}], 
       "\[IndentingNewLine]", "]"}]}], "]"}]}]}], ";"}]}], "Input"],

Cell["Top of stack is displayed on the LEFT, bottom on the RIGHT.", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", "}"}]}], "}"}], "/.", "execAllTrace2"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "pop"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"pop", 
     RowBox[{"{", "a", "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "minus"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"minus", 
     RowBox[{"{", 
      RowBox[{"a", "-", "b"}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "plus"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"plus", 
     RowBox[{"{", 
      RowBox[{"a", "+", "b"}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "minus"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"minus", 
     RowBox[{"{", 
      RowBox[{"a", "-", "b"}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "times"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"times", 
     RowBox[{"{", 
      RowBox[{"a", " ", "b"}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "b", ",", "div"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"div", 
     RowBox[{"{", 
      FractionBox["a", "b"], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
     "x", ",", "y", ",", "z", ",", "t", ",", "rot", ",", "rot", ",", "rot"}], 
     "}"}]}], "}"}], "/.", "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"x", 
     RowBox[{"{", "x", "}"}]},
    {"y", 
     RowBox[{"{", 
      RowBox[{"y", ",", "x"}], "}"}]},
    {"z", 
     RowBox[{"{", 
      RowBox[{"z", ",", "y", ",", "x"}], "}"}]},
    {"t", 
     RowBox[{"{", 
      RowBox[{"t", ",", "z", ",", "y", ",", "x"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"z", ",", "y", ",", "x", ",", "t"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"y", ",", "x", ",", "t", ",", "z"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"x", ",", "t", ",", "z", ",", "y"}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"x", ",", "y", ",", "z", ",", "swap"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"x", 
     RowBox[{"{", "x", "}"}]},
    {"y", 
     RowBox[{"{", 
      RowBox[{"y", ",", "x"}], "}"}]},
    {"z", 
     RowBox[{"{", 
      RowBox[{"z", ",", "y", ",", "x"}], "}"}]},
    {"swap", 
     RowBox[{"{", 
      RowBox[{"y", ",", "z", ",", "x"}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
     "a", ",", "b", ",", "3", ",", "4", ",", "plus", ",", "rot", ",", "div", 
      ",", "plus"}], "}"}]}], "}"}], "/.", "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", "}"}]},
    {"a", 
     RowBox[{"{", "a", "}"}]},
    {"b", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a"}], "}"}]},
    {"3", 
     RowBox[{"{", 
      RowBox[{"3", ",", "b", ",", "a"}], "}"}]},
    {"4", 
     RowBox[{"{", 
      RowBox[{"4", ",", "3", ",", "b", ",", "a"}], "}"}]},
    {"plus", 
     RowBox[{"{", 
      RowBox[{"7", ",", "b", ",", "a"}], "}"}]},
    {"rot", 
     RowBox[{"{", 
      RowBox[{"b", ",", "a", ",", "7"}], "}"}]},
    {"div", 
     RowBox[{"{", 
      RowBox[{
       FractionBox["a", "b"], ",", "7"}], "}"}]},
    {"plus", 
     RowBox[{"{", 
      RowBox[{"7", "+", 
       FractionBox["a", "b"]}], "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"3", ",", "4"}], "}"}], ",", 
    RowBox[{"{", "plus", "}"}]}], "}"}], "/.", "execAllTrace2"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"start", 
     RowBox[{"{", 
      RowBox[{"3", ",", "4"}], "}"}]},
    {"plus", 
     RowBox[{"{", "7", "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell["\<\
\[LineSeparator]Expect exceptions from the next two\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"a", ",", "plus"}], "}"}]}], "}"}], "/.", 
  "execAllTrace2"}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"nextR: deficient \
stack\\\"]\\)\[NoBreak] returned to top level. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", ButtonNote -> \
\\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"nextR: deficient stack\"\>", "]"}], 
  "]"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"{", 
   RowBox[{
    RowBox[{"{", "}"}], ",", 
    RowBox[{"{", "plus", "}"}]}], "}"}], "/.", "execAllTrace2"}]], "Input"],

Cell[BoxData[
 RowBox[{
  StyleBox[
   RowBox[{"Throw", "::", "nocatch"}], "MessageName"], 
  RowBox[{
  ":", " "}], "\<\"Uncaught \[NoBreak]\\!\\(Throw[\\\"nextR: deficient \
stack\\\"]\\)\[NoBreak] returned to top level. \\!\\(\\*ButtonBox[\\\"\
\[RightSkeleton]\\\", ButtonStyle->\\\"Link\\\", ButtonFrame->None, \
ButtonData:>\\\"paclet:ref/message/Throw/nocatch\\\", ButtonNote -> \
\\\"Throw::nocatch\\\"]\\)\"\>"}]], "Message", "MSG"],

Cell[BoxData[
 RowBox[{"Hold", "[", 
  RowBox[{"Throw", "[", "\<\"nextR: deficient stack\"\>", "]"}], 
  "]"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{720, 852},
WindowMargins->{{0, Automatic}, {Automatic, 0}},
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
Cell[1485, 35, 33, 0, 90, "Title"],
Cell[1521, 37, 63, 2, 31, "Subtitle"],
Cell[1587, 41, 47, 0, 40, "Author"],
Cell[1637, 43, 32, 0, 42, "Date"],
Cell[CellGroupData[{
Cell[1694, 47, 64, 2, 82, "Section"],
Cell[1761, 51, 57, 2, 30, "Text"],
Cell[CellGroupData[{
Cell[1843, 57, 275, 7, 72, "Input"],
Cell[2121, 66, 31, 0, 37, "Output"]
}, Open  ]],
Cell[2167, 69, 133, 4, 31, "Text"],
Cell[CellGroupData[{
Cell[2325, 77, 305, 8, 72, "Input"],
Cell[2633, 87, 31, 0, 37, "Output"]
}, Open  ]],
Cell[2679, 90, 133, 6, 31, "Text"],
Cell[CellGroupData[{
Cell[2837, 100, 92, 2, 37, "Input"],
Cell[2932, 104, 31, 0, 37, "Output"]
}, Open  ]],
Cell[2978, 107, 267, 6, 50, "Text"],
Cell[CellGroupData[{
Cell[3270, 117, 301, 8, 72, "Input"],
Cell[3574, 127, 49, 0, 37, "Output"]
}, Open  ]],
Cell[3638, 130, 290, 9, 51, "Text"],
Cell[CellGroupData[{
Cell[3953, 143, 308, 8, 72, "Input"],
Cell[4264, 153, 31, 0, 37, "Output"]
}, Open  ]]
}, Open  ]],
Cell[4322, 157, 54, 0, 82, "Section"],
Cell[4379, 159, 65, 2, 52, "Section"],
Cell[4447, 163, 44, 0, 52, "Section"],
Cell[CellGroupData[{
Cell[4516, 167, 47, 0, 52, "Section"],
Cell[4566, 169, 56, 2, 30, "Text"],
Cell[4625, 173, 2639, 87, 210, "Input"],
Cell[CellGroupData[{
Cell[7289, 264, 29, 0, 32, "Subsection"],
Cell[7321, 266, 6700, 188, 531, "Input"],
Cell[14024, 456, 75, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[14124, 460, 170, 5, 37, "Input"],
Cell[14297, 467, 443, 16, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14777, 488, 170, 5, 37, "Input"],
Cell[14950, 495, 443, 16, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15430, 516, 168, 5, 37, "Input"],
Cell[15601, 523, 439, 16, 110, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16077, 544, 222, 7, 37, "Input"],
Cell[16302, 553, 811, 28, 174, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17150, 586, 179, 5, 37, "Input"],
Cell[17332, 593, 531, 19, 120, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17900, 617, 164, 5, 37, "Input"],
Cell[18067, 624, 336, 11, 66, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18440, 640, 237, 7, 37, "Input"],
Cell[18680, 649, 896, 33, 208, "Output"]
}, Open  ]],
Cell[19591, 685, 51, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[19667, 689, 159, 5, 37, "Input"],
Cell[19829, 696, 441, 9, 24, "Message"],
Cell[20273, 707, 122, 3, 37, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20432, 715, 134, 4, 37, "Input"],
Cell[20569, 721, 441, 9, 24, "Message"],
Cell[21013, 732, 122, 3, 37, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[21184, 741, 27, 0, 32, "Subsection"],
Cell[21214, 743, 137, 4, 31, "Text"],
Cell[21354, 749, 2860, 83, 259, "Input"],
Cell[24217, 834, 75, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[24317, 838, 149, 5, 37, "Input"],
Cell[24469, 845, 111, 4, 37, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24617, 854, 195, 7, 37, "Input"],
Cell[24815, 863, 414, 15, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25266, 883, 197, 7, 37, "Input"],
Cell[25466, 892, 443, 16, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25946, 913, 196, 7, 37, "Input"],
Cell[26145, 922, 442, 16, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26624, 943, 197, 7, 37, "Input"],
Cell[26824, 952, 443, 16, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27304, 973, 197, 7, 37, "Input"],
Cell[27504, 982, 443, 16, 102, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27984, 1003, 195, 7, 37, "Input"],
Cell[28182, 1012, 439, 16, 110, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28658, 1033, 248, 8, 37, "Input"],
Cell[28909, 1043, 811, 28, 174, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29757, 1076, 206, 7, 37, "Input"],
Cell[29966, 1085, 531, 19, 120, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30534, 1109, 263, 8, 37, "Input"],
Cell[30800, 1119, 896, 33, 208, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31733, 1157, 188, 6, 37, "Input"],
Cell[31924, 1165, 336, 11, 66, "Output"]
}, Open  ]],
Cell[32275, 1179, 75, 2, 49, "Text"],
Cell[CellGroupData[{
Cell[32375, 1185, 186, 7, 37, "Input"],
Cell[32564, 1194, 441, 9, 24, "Message"],
Cell[33008, 1205, 122, 3, 37, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33167, 1213, 157, 5, 37, "Input"],
Cell[33327, 1220, 441, 9, 24, "Message"],
Cell[33771, 1231, 122, 3, 71, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature yxDzhaun1G0HxBwtwBwUAVB9 *)
