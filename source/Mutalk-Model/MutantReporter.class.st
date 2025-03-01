Class {
	#name : #MutantReporter,
	#superclass : #Object,
	#instVars : [
		'mutantEvaluationResult'
	],
	#category : #'Mutalk-Model-Reporting'
}

{ #category : #'instance creation' }
MutantReporter class >> for: aMutantEvaluationResult [ 
	^self new 
		initializeFor: aMutantEvaluationResult;
		yourself 
]

{ #category : #'initialize-release' }
MutantReporter >> initializeFor: aMutantEvaluationResult [ 

	mutantEvaluationResult := aMutantEvaluationResult 
]

{ #category : #evaluating }
MutantReporter >> value [
	| stream |
	stream := String
		streamContents: [ :str | 
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Mutant Generated: ';
				nextPutAll: mutantEvaluationResult printString;
				cr.
			str
				nextPutAll: '----------------';
				cr.
			str
				nextPutAll: 'Result --> ';
				nextPutAll: mutantEvaluationResult resultString;
				cr.
			mutantEvaluationResult printDetailedResultOn: str.
			str cr ].
	^ stream contents
]
