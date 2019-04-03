Class {
	#name : #CTOrderPreservingIdentityDictionaryTest,
	#superclass : #CTOrderPreservingDictionaryTest,
	#category : #'Containers-OrderPreservingDictionary-Tests'
}

{ #category : #accessing }
CTOrderPreservingIdentityDictionaryTest >> dictionaryClass [
	^ CTOrderPreservingIdentityDictionary
]

{ #category : #testing }
CTOrderPreservingIdentityDictionaryTest >> isTestingIdentityDictionary [
	^ true
]
