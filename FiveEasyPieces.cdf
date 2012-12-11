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
NotebookDataLength[     36333,       1306]
NotebookOptionsPosition[     33207,       1179]
NotebookOutlinePosition[     33728,       1197]
CellTagsIndexPosition[     33685,       1194]
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
Cell[1761, 51, 57, 2, 45, "Text"],
Cell[CellGroupData[{
Cell[1843, 57, 275, 7, 118, "Input"],
Cell[2121, 66, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2167, 69, 133, 4, 46, "Text"],
Cell[CellGroupData[{
Cell[2325, 77, 305, 8, 118, "Input"],
Cell[2633, 87, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2679, 90, 133, 6, 46, "Text"],
Cell[CellGroupData[{
Cell[2837, 100, 92, 2, 59, "Input"],
Cell[2932, 104, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2978, 107, 267, 6, 75, "Text"],
Cell[CellGroupData[{
Cell[3270, 117, 301, 8, 118, "Input"],
Cell[3574, 127, 49, 0, 58, "Output"]
}, Open  ]],
Cell[3638, 130, 290, 9, 76, "Text"],
Cell[CellGroupData[{
Cell[3953, 143, 308, 8, 118, "Input"],
Cell[4264, 153, 31, 0, 58, "Output"]
}, Open  ]]
}, Open  ]],
Cell[4322, 157, 54, 0, 120, "Section"],
Cell[4379, 159, 65, 2, 73, "Section"],
Cell[4447, 163, 44, 0, 73, "Section"],
Cell[CellGroupData[{
Cell[4516, 167, 47, 0, 73, "Section"],
Cell[4566, 169, 56, 2, 45, "Text"],
Cell[4625, 173, 2249, 74, 321, "Input"],
Cell[CellGroupData[{
Cell[6899, 251, 29, 0, 47, "Subsection"],
Cell[6931, 253, 5820, 159, 872, "Input"],
Cell[12754, 414, 75, 0, 45, "Text"],
Cell[CellGroupData[{
Cell[12854, 418, 170, 5, 59, "Input"],
Cell[13027, 425, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13507, 446, 170, 5, 59, "Input"],
Cell[13680, 453, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14160, 474, 168, 5, 59, "Input"],
Cell[14331, 481, 439, 16, 162, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14807, 502, 222, 7, 59, "Input"],
Cell[15032, 511, 811, 28, 258, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15880, 544, 179, 5, 59, "Input"],
Cell[16062, 551, 531, 19, 177, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16630, 575, 164, 5, 59, "Input"],
Cell[16797, 582, 336, 11, 96, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17170, 598, 237, 7, 59, "Input"],
Cell[17410, 607, 896, 33, 309, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[18355, 646, 27, 0, 47, "Subsection"],
Cell[18385, 648, 58, 2, 45, "Text"],
Cell[18446, 652, 6663, 177, 901, "Input"],
Cell[25112, 831, 75, 0, 45, "Text"],
Cell[CellGroupData[{
Cell[25212, 835, 149, 5, 59, "Input"],
Cell[25364, 842, 111, 4, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25512, 851, 195, 7, 59, "Input"],
Cell[25710, 860, 414, 15, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26161, 880, 197, 7, 59, "Input"],
Cell[26361, 889, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26841, 910, 196, 7, 59, "Input"],
Cell[27040, 919, 442, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27519, 940, 197, 7, 59, "Input"],
Cell[27719, 949, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28199, 970, 197, 7, 59, "Input"],
Cell[28399, 979, 443, 16, 150, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28879, 1000, 195, 7, 59, "Input"],
Cell[29077, 1009, 439, 16, 162, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29553, 1030, 248, 8, 59, "Input"],
Cell[29804, 1040, 811, 28, 258, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30652, 1073, 206, 7, 59, "Input"],
Cell[30861, 1082, 531, 19, 177, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31429, 1106, 263, 8, 59, "Input"],
Cell[31695, 1116, 896, 33, 309, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32628, 1154, 188, 6, 59, "Input"],
Cell[32819, 1162, 336, 11, 133, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 1w063nfE0C4JpCgwTT1TniRo *)
