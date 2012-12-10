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
NotebookDataLength[     36602,       1312]
NotebookOptionsPosition[     33477,       1185]
NotebookOutlinePosition[     33998,       1203]
CellTagsIndexPosition[     33955,       1200]
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
      ",", "nextR"}], "]"}], ";"}], "\[IndentingNewLine]", 
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
     RowBox[{"{", 
      RowBox[{"top_", ",", "rest___"}], "}"}], "\[RuleDelayed]", "top"}], 
    "}"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"nextR", "=", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"top_", ",", "next_", ",", "rest___"}], "}"}], "\[RuleDelayed]",
      "next"}], "}"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell["Toccata", "Subsection"],

Cell[BoxData[{
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
    "gridStack"}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"ClearAll", "/@", "instructionSet"}], ";"}], "\[IndentingNewLine]", 
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
       RowBox[{"times", "\[RuleDelayed]", 
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
       RowBox[{"minus", "\[RuleDelayed]", 
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
       RowBox[{"div", "\[RuleDelayed]", 
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
        RowBox[{"pop", "\[RuleDelayed]", "stack"}], "/.", "popR"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"dup", "\[RuleDelayed]", "stack"}], "/.", "dupR"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"rot", "\[RuleDelayed]", "stack"}], "/.", "rotR"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"swap", "\[RuleDelayed]", "stack"}], "/.", "swapR"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{"(*", " ", 
        RowBox[{
         RowBox[{"UNARY", " ", "--"}], " ", "DEFAULT"}], " ", "*)"}], 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"x_", "\[RuleDelayed]", 
         RowBox[{"{", 
          RowBox[{"stack", ",", "x"}], "}"}]}], "/.", "pushR"}]}], 
      "\[IndentingNewLine]", "}"}]}]}]}], ";"}], "\[IndentingNewLine]", 
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
    RowBox[{"{", "stack", "}"}], "]"}]}]}]}], "Input"],

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
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Fugue", "Subsection"],

Cell["\<\
All rules -- no function notation.\
\>", "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"ClearAll", "[", 
   RowBox[{"exec2", ",", "execAll2", ",", "execAllTrace2"}], "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"exec2", "=", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"stack_", ",", "instr_"}], "}"}], "\[RuleDelayed]", 
     "\[IndentingNewLine]", 
     RowBox[{"(", 
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
          RowBox[{"times", "\[RuleDelayed]", 
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
          RowBox[{"minus", "\[RuleDelayed]", 
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
          RowBox[{"div", "\[RuleDelayed]", 
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
           RowBox[{"pop", "\[RuleDelayed]", "stack"}], "/.", "popR"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"dup", "\[RuleDelayed]", "stack"}], "/.", "dupR"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"rot", "\[RuleDelayed]", "stack"}], "/.", "rotR"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"swap", "\[RuleDelayed]", "stack"}], "/.", "swapR"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"(*", " ", 
           RowBox[{
            RowBox[{"UNARY", " ", "--"}], " ", "DEFAULT"}], " ", "*)"}], 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"x_", "\[RuleDelayed]", 
            RowBox[{"{", 
             RowBox[{"stack", ",", "x"}], "}"}]}], "/.", "pushR"}]}], 
         "\[IndentingNewLine]", "}"}]}]}], ")"}]}]}], ";"}], 
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
      RowBox[{"{", 
       RowBox[{"instr_", ",", "instrs___"}], "}"}]}], "}"}], "\[RuleDelayed]",
     "\[IndentingNewLine]", 
    RowBox[{"With", "[", 
     RowBox[{
      RowBox[{"{", "\[IndentingNewLine]", 
       RowBox[{"execAllTrace2Internal", "=", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", "history___", "}"}], ",", "stackX_", ",", 
           RowBox[{"{", 
            RowBox[{"instrX_", ",", "instrsX___"}], "}"}]}], "}"}], 
         "\[RuleDelayed]", "\[IndentingNewLine]", 
         RowBox[{"With", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"newStack", "=", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"stackX", ",", "instrX"}], "}"}], "/.", "exec2"}]}], 
            "}"}], ",", "\[IndentingNewLine]", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"history", ",", 
               RowBox[{"{", 
                RowBox[{"instrX", ",", "newStack"}], "}"}]}], "}"}], ",", 
             "newStack", ",", 
             RowBox[{"{", "instrsX", "}"}]}], "}"}]}], "]"}]}]}], "}"}], ",", 
      "\[IndentingNewLine]", 
      RowBox[{"Grid", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"(", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"{", 
               RowBox[{"start", ",", 
                RowBox[{"{", "}"}]}], "}"}], "}"}], ",", "stack", ",", 
             RowBox[{"{", 
              RowBox[{"instr", ",", "instrs"}], "}"}]}], "}"}], "//.", 
           "execAllTrace2Internal"}], ")"}], "\[LeftDoubleBracket]", "1", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{"Frame", "\[Rule]", "All"}]}], "]"}]}], "]"}]}]}], 
  ";"}]}], "Input"],

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
     RowBox[{"{", "}"}]},
    {"plus", 
     RowBox[{"{", "7", "}"}]}
   },
   AutoDelete->False,
   GridBoxFrame->{"Columns" -> {{True}}, "Rows" -> {{True}}},
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1262, 1429},
WindowMargins->{{0, Automatic}, {Automatic, 2}},
Magnification:>FEPrivate`If[
  FEPrivate`Equal[FEPrivate`$VersionNumber, 6.], 1.5, 1.5 Inherited],
FrontEndVersion->"9.0 for Microsoft Windows (64-bit) (November 20, 2012)",
StyleDefinitions->FrontEnd`FileName[{"Report"}, "StandardReport.nb", 
  CharacterEncoding -> "WindowsANSI"]
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
Cell[1485, 35, 33, 0, 131, "Title"],
Cell[1521, 37, 63, 2, 44, "Subtitle"],
Cell[1587, 41, 47, 0, 61, "Author"],
Cell[1637, 43, 32, 0, 64, "Date"],
Cell[CellGroupData[{
Cell[1694, 47, 64, 2, 120, "Section"],
Cell[1761, 51, 46, 0, 45, "Text"],
Cell[CellGroupData[{
Cell[1832, 55, 275, 7, 118, "Input"],
Cell[2110, 64, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2156, 67, 133, 4, 46, "Text"],
Cell[CellGroupData[{
Cell[2314, 75, 305, 8, 118, "Input"],
Cell[2622, 85, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2668, 88, 133, 6, 46, "Text"],
Cell[CellGroupData[{
Cell[2826, 98, 92, 2, 59, "Input"],
Cell[2921, 102, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2967, 105, 267, 6, 75, "Text"],
Cell[CellGroupData[{
Cell[3259, 115, 301, 8, 118, "Input"],
Cell[3563, 125, 49, 0, 58, "Output"]
}, Open  ]],
Cell[3627, 128, 290, 9, 76, "Text"],
Cell[CellGroupData[{
Cell[3942, 141, 308, 8, 118, "Input"],
Cell[4253, 151, 31, 0, 58, "Output"]
}, Open  ]]
}, Open  ]],
Cell[4311, 155, 54, 0, 120, "Section"],
Cell[4368, 157, 65, 2, 73, "Section"],
Cell[4436, 161, 44, 0, 73, "Section"],
Cell[CellGroupData[{
Cell[4505, 165, 47, 0, 73, "Section"],
Cell[4555, 167, 56, 2, 45, "Text"],
Cell[4614, 171, 2249, 74, 321, "Input"],
Cell[CellGroupData[{
Cell[6888, 249, 29, 0, 47, "Subsection"],
Cell[6920, 251, 5820, 159, 872, "Input"],
Cell[12743, 412, 75, 0, 45, "Text"],
Cell[CellGroupData[{
Cell[12843, 416, 170, 5, 59, "Input"],
Cell[13016, 423, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13496, 444, 170, 5, 59, "Input"],
Cell[13669, 451, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14149, 472, 168, 5, 59, "Input"],
Cell[14320, 479, 439, 16, 162, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14796, 500, 222, 7, 59, "Input"],
Cell[15021, 509, 811, 28, 258, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15869, 542, 179, 5, 59, "Input"],
Cell[16051, 549, 531, 19, 177, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16619, 573, 164, 5, 59, "Input"],
Cell[16786, 580, 336, 11, 96, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17159, 596, 237, 7, 59, "Input"],
Cell[17399, 605, 896, 33, 309, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[18344, 644, 27, 0, 47, "Subsection"],
Cell[18374, 646, 58, 2, 45, "Text"],
Cell[18435, 650, 6976, 186, 930, "Input"],
Cell[25414, 838, 75, 0, 45, "Text"],
Cell[CellGroupData[{
Cell[25514, 842, 149, 5, 59, "Input"],
Cell[25666, 849, 111, 4, 77, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25814, 858, 195, 7, 59, "Input"],
Cell[26012, 867, 414, 15, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26463, 887, 197, 7, 59, "Input"],
Cell[26663, 896, 443, 16, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27143, 917, 196, 7, 59, "Input"],
Cell[27342, 926, 442, 16, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27821, 947, 197, 7, 59, "Input"],
Cell[28021, 956, 443, 16, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28501, 977, 197, 7, 59, "Input"],
Cell[28701, 986, 443, 16, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29181, 1007, 195, 7, 59, "Input"],
Cell[29379, 1016, 439, 16, 218, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29855, 1037, 248, 8, 59, "Input"],
Cell[30106, 1047, 811, 28, 277, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30954, 1080, 206, 7, 59, "Input"],
Cell[31163, 1089, 531, 19, 196, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31731, 1113, 263, 8, 59, "Input"],
Cell[31997, 1123, 896, 33, 328, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32930, 1161, 188, 6, 59, "Input"],
Cell[33121, 1169, 304, 10, 115, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 3vTp@03iQ4Mt3B1pA6FWzrpR *)
