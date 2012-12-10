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
NotebookDataLength[     20761,        756]
NotebookOptionsPosition[     18942,        674]
NotebookOutlinePosition[     19463,        692]
CellTagsIndexPosition[     19420,        689]
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
    "pushR", ",", "popR", ",", "dupR", ",", "swapR", ",", "rotR", ",", "topR",
      ",", "nextR"}], "]"}], ";"}], "\[IndentingNewLine]", 
  RowBox[{"(*", " ", 
   RowBox[{"stack", "-", "to", "-", 
    RowBox[{"stack", " ", "transforms"}]}], " ", "*)"}]}], "\n", 
 RowBox[{
  RowBox[{"pushR", "=", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", "stack___", "}"}], ",", "datum_"}], "}"}], 
    "\[RuleDelayed]", 
    RowBox[{"{", 
     RowBox[{"datum", ",", "stack"}], "}"}]}]}], ";"}], "\[IndentingNewLine]", 
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
        RowBox[{"_", "\[RuleDelayed]", 
         RowBox[{"{", 
          RowBox[{"stack", ",", "instr"}], "}"}]}], "/.", "pushR"}]}], 
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
   RowBox[{"Module", "[", 
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

Cell["\<\
Top of stack is displayed on the LEFT, bottom on the RIGHT.\
\>", "Text"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAll", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b", ",", "pop"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {"a"}
   },
   AutoDelete->False,
   GridBoxItemSize->{"Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}],
  "Grid"]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"execAll", "[", 
  RowBox[{
   RowBox[{"{", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"a", ",", "b", ",", "plus"}], "}"}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[GridBox[{
    {
     RowBox[{"a", "+", "b"}]}
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
Cell[1832, 55, 190, 5, 89, "Input"],
Cell[2025, 62, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2071, 65, 133, 4, 46, "Text"],
Cell[CellGroupData[{
Cell[2229, 73, 305, 8, 118, "Input"],
Cell[2537, 83, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2583, 86, 133, 6, 46, "Text"],
Cell[CellGroupData[{
Cell[2741, 96, 92, 2, 59, "Input"],
Cell[2836, 100, 31, 0, 58, "Output"]
}, Open  ]],
Cell[2882, 103, 267, 6, 75, "Text"],
Cell[CellGroupData[{
Cell[3174, 113, 301, 8, 118, "Input"],
Cell[3478, 123, 49, 0, 58, "Output"]
}, Open  ]],
Cell[3542, 126, 290, 9, 76, "Text"],
Cell[CellGroupData[{
Cell[3857, 139, 308, 8, 118, "Input"],
Cell[4168, 149, 31, 0, 58, "Output"]
}, Open  ]]
}, Open  ]],
Cell[4226, 153, 54, 0, 120, "Section"],
Cell[4283, 155, 65, 2, 73, "Section"],
Cell[4351, 159, 44, 0, 73, "Section"],
Cell[CellGroupData[{
Cell[4420, 163, 47, 0, 73, "Section"],
Cell[4470, 165, 56, 2, 45, "Text"],
Cell[4529, 169, 2215, 72, 321, "Input"],
Cell[6747, 243, 5825, 159, 872, "Input"],
Cell[12575, 404, 83, 2, 45, "Text"],
Cell[CellGroupData[{
Cell[12683, 410, 163, 5, 59, "Input"],
Cell[12849, 417, 167, 6, 77, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13053, 428, 164, 5, 59, "Input"],
Cell[13220, 435, 193, 7, 77, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13450, 447, 170, 5, 59, "Input"],
Cell[13623, 454, 443, 16, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14103, 475, 170, 5, 59, "Input"],
Cell[14276, 482, 443, 16, 169, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14756, 503, 168, 5, 59, "Input"],
Cell[14927, 510, 439, 16, 181, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15403, 531, 222, 7, 59, "Input"],
Cell[15628, 540, 811, 28, 277, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16476, 573, 179, 5, 59, "Input"],
Cell[16658, 580, 531, 19, 196, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17226, 604, 237, 7, 59, "Input"],
Cell[17466, 613, 896, 33, 328, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18399, 651, 164, 5, 59, "Input"],
Cell[18566, 658, 336, 11, 152, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Owptr92OMnnR4AgfIKyBwGqR *)
