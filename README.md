Twenty Seconds Curriculum Vitae in LaTex
========================================

# Curricula Vitae - Résumés
A curriculum vitae, otherwise known as a CV or résumé, is a document used by individuals to communicate their work history, education and skill set. This is a style template for your curriculum written in LaTex. The main goal of this template is to provide a curriculum that is able to survive to the résumés screening of "twenty seconds".

_The author assumes no responsibility for the topicality, correctness, completeness or quality of the information provided and for the obtained résumés._

This is designed for computer scientists but there is no limitation to use it for résumés in other disciplines.

##The basic idea is KISS - Keep It Simple, Stupid.

In a nutshell _**"It is vain to do with more what can be done with fewer"**_ -- Occam's razor --

* **This template has been designed to create a "one-page" résumé is therefore not suitable to create curriculum of more than one-page.** 

* _Please do not try to create curriculum more than one-page._ 

###How to describe your experiences?

There are many theories about the résumé screening process of "Big" companies.
Resume screeners and the interviewers look in your résumé for:

- Are you smart?
- Can you code (act for what you apply)?

Anyway according to the guidelines of this template you should use a really simple form to describe each items in your résumé: 

	Accomplished <X> by implementing <Y> which led to <Z>

Here's an examples:
	
	Reduced object rendering time by 75% by applying Floyd's algorithm, leading to a 10% reduction in system boot time.
	
-- _Cracking the Coding Interview, Book, Gayle Laakmann Mcdowell_ --

##Toy Résumé
***
![sample résumé](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex/raw/master/Twenty-Seconds_cv.jpg)
***

# Build 
This guide walks you to build your résumé.

Build requirements:

* LaTex installation.
	* additionals packages:	 	
		- ClearSans, fontenc
		- tikz
		- xcolor
		- textpos
		- ragged2e
		- etoolbox
		- ifmtarg
		- ifthen
		- pgffor
		- marvosym
		- parskip

###Build through GNU Make command
Clean your project résumé.
	
	make clean
	
Build your project résumé.

	make all
	
-- _Alternately you can build through your favorite LaTex editor._ --

#Environment style and list of commands

The style is divided in two parts. The former is the left side bar: that contains personal information, profile picture, and information about your professional skills. The second part is the body that should be contains details about your academic studies, professional experiences and all the information that you want (remember the KISS principle).

###Profile environment
These are the command to set up the profile information.

* Set up the image profile.
	
		\profilepic{paht_name}
* Set up your name.
	
		\cvname{your name}
* Set up your job profile.
	
		\cvjobtitle{your job title}
* Set up your date of birth.
	
		\cvdate{date}	
* Set up your address.
	
		\cvaddress{address}		
* Set up your telephone number.
	
		\cvnumberphone{phone number}
* Set up your email.
	
		\cvmail{email address}
* Set up your personal home page.
	
		\cvsite{home page address}
* Set up a brief description of you.
	
		\about{brief description}
* Set up the skills with chart style. Each skill must is a couple `{name/value}`, where the value is a floating point value between `0` and `6`. This is an agreement for the graphics issues, the `0` correspond to a Fundamental awareness while `6` to a Expert awareness level.
	
		\skills{{name skill1/5.8},{name skill2/4}} 
* Set up the skills with text style.
	
		\skillstext{{name skill1/5.8},{name skill2/4}} 

To create the profile use the command:

	\makeprofile

###Body environment
The body document part is composed by sections.
In the sections you can put two kinds of list items.

The first (_Twenty items environment_) intends a list of detailed information with four part: **Data** -- **Title** -- **Place** -- **Description**. 

The second (_Twenty items short environment_) intends a fewer informationinformation (you can customize this list more easily): **Data** -- **Description**.
#### Sections
* Set up a new section in the body part.
		
		\section{sction name}


####Twenty items environment
```
\begin{twenty}
  \twentyitem
    {year}
    {title}
    {place}
    {description}
\end{twenty}
```

#### Twenty items short environment
```
\begin{twentyshort}
  \twentyitemshort
    {year}
    {description}
\end{twentyshort}
```
###Other commands
There other two fun command: \icon and \round; that enables to wrap the text in oval shape.

```
	\icon{text}
	\round{text, color}
```
