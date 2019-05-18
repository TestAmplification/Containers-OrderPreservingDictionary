"
By default, when CTOrderPreservingDictionaryionary raises an exception. 
I'm a special kind of order-preserving dictionary that returns a configurable default value (nil by default) instead of raising an exception. 

| dict |
dict := CTOrderPreservingDictionary new. 
dict defaultValue: 666.
dict at: #missing
>>> 666

See test in CTOrderPreservingDictionaryTest>>#testDefaultValue 
"
Class {
	#name : #CTOrderPreservingDictionary,
	#superclass : #CTStandardOrderedDictionary,
	#instVars : [
		'defaultValue'
	],
	#category : #'Containers-OrderPreservingDictionary'
}

{ #category : #'instance creation' }
CTOrderPreservingDictionary class >> defaultValue: aDefaultValue [
	^ self new defaultValue: aDefaultValue
]

{ #category : #'instance creation' }
CTOrderPreservingDictionary class >> new: aCapacity withDefaultValue: aDefaultValue [
	^ self basicNew
		initialize: aCapacity
		withDefaultValue: aDefaultValue
]

{ #category : #'instance creation' }
CTOrderPreservingDictionary class >> newFrom: anAssociationCollection [
	| newDictionary |

	newDictionary := super newFrom: anAssociationCollection.
	(anAssociationCollection respondsTo: #defaultValue)
		ifTrue: [newDictionary defaultValue: anAssociationCollection defaultValue].
	^ newDictionary.
]

{ #category : #accessing }
CTOrderPreservingDictionary >> associationAt: aKey [
	^ self
		associationAt: aKey
		ifAbsent: [nil]
]

{ #category : #accessing }
CTOrderPreservingDictionary >> at: aKey [
	^ self
		at: aKey
		ifAbsent: [defaultValue]
]

{ #category : #copying }
CTOrderPreservingDictionary >> copyEmpty [
	^ self species defaultValue: defaultValue
]

{ #category : #accessing }
CTOrderPreservingDictionary >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
CTOrderPreservingDictionary >> defaultValue: aDefaultValue [
	defaultValue := aDefaultValue
]

{ #category : #initialization }
CTOrderPreservingDictionary >> initialize: aCapacity withDefaultValue: aDefaultValue [
	self initialize: aCapacity.
	defaultValue := aDefaultValue.
]

{ #category : #accessing }
CTOrderPreservingDictionary >> keyAtIdentityValue: aValue [
	^ self
		keyAtIdentityValue: aValue
		ifAbsent: [defaultValue]
]

{ #category : #accessing }
CTOrderPreservingDictionary >> keyAtIndex: anIndex [
	^ self
		keyAtIndex: anIndex
		ifAbsent: [defaultValue]
]

{ #category : #accessing }
CTOrderPreservingDictionary >> keyAtValue: aValue [
	^ self
		keyAtValue: aValue
		ifAbsent: [defaultValue]
]

{ #category : #removing }
CTOrderPreservingDictionary >> removeKey: aKey [
	^ self
		removeKey: aKey
		ifAbsent: [defaultValue]
]

{ #category : #private }
CTOrderPreservingDictionary >> speciesNewFrom: anAssociationCollection [
	^ (self species newFrom: anAssociationCollection)
		defaultValue: defaultValue
]
