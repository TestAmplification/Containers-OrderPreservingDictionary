"
I am BaselineOfOrderPreservingDictionary.
I am a BaselineOf.
"
Class {
	#name : #BaselineOfContainersOrderPreservingDictionary,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersOrderPreservingDictionary
}

{ #category : #baselines }
BaselineOfContainersOrderPreservingDictionary >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Containers-OrderPreservingDictionary';
				package: 'Containers-OrderPreservingDictionary-Tests' with: [ spec requires: #('Containers-OrderPreservingDictionary') ];
				group: 'default' with: #('core' 'tests');
				group: 'core' with: #('Containers-OrderPreservingDictionary');
				group: 'tests' with: #('Containers-OrderPreservingDictionary-Tests') ]
]
