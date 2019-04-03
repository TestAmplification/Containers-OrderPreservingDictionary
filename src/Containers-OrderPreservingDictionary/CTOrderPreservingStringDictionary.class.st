"
An order-preserving dictionary for strings that returns empty strings instead of raising errors when absent keys/values are accessed.
"
Class {
	#name : #CTOrderPreservingStringDictionary,
	#superclass : #CTStandardOrderedDictionary,
	#category : #'Containers-OrderPreservingDictionary'
}

{ #category : #accessing }
CTOrderPreservingStringDictionary >> associationAt: aKey [
	^ self
		associationAt: aKey
		ifAbsent: [nil]
]

{ #category : #accessing }
CTOrderPreservingStringDictionary >> at: aKey [
	^ self
		at: aKey
		ifAbsent: ['']
]

{ #category : #accessing }
CTOrderPreservingStringDictionary >> keyAtIdentityValue: aValue [
	^ self
		keyAtIdentityValue: aValue
		ifAbsent: ['']
]

{ #category : #accessing }
CTOrderPreservingStringDictionary >> keyAtIndex: anIndex [
	^ self
		keyAtIndex: anIndex
		ifAbsent: ['']
]

{ #category : #accessing }
CTOrderPreservingStringDictionary >> keyAtValue: aValue [
	^ self
		keyAtValue: aValue
		ifAbsent: ['']
]

{ #category : #removing }
CTOrderPreservingStringDictionary >> removeKey: aKey [
	^ self
		removeKey: aKey
		ifAbsent: ['']
]
