Class {
	#name : #CTOrderPreservingIdentityStringDictionaryTest,
	#superclass : #CTOrderPreservingStringDictionaryTest,
	#category : #'Containers-OrderPreservingDictionary-Tests'
}

{ #category : #accessing }
CTOrderPreservingIdentityStringDictionaryTest >> dictionaryClass [
	^ CTOrderPreservingIdentityStringDictionary
]

{ #category : #testing }
CTOrderPreservingIdentityStringDictionaryTest >> isTestingIdentityDictionary [
	^ true
]
