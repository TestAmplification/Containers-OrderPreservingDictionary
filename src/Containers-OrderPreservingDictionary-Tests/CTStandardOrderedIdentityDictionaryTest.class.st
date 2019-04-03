Class {
	#name : #CTStandardOrderedIdentityDictionaryTest,
	#superclass : #CTStandardOrderedDictionaryTest,
	#category : #'Containers-OrderPreservingDictionary-Tests'
}

{ #category : #accessing }
CTStandardOrderedIdentityDictionaryTest >> dictionaryClass [
	^ CTStandardOrderedIdentityDictionary
]

{ #category : #testing }
CTStandardOrderedIdentityDictionaryTest >> isTestingIdentityDictionary [
	^ true
]
