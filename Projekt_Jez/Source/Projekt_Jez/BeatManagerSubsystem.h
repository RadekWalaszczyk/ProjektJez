// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "MovieSceneSequencePlayer.h"
#include "BeatManagerSubsystem.generated.h"

/**
 * 
 */
UCLASS(Abstract, Blueprintable)
class PROJEKT_JEZ_API UBeatManagerSubsystem : public UGameInstanceSubsystem
{
	GENERATED_BODY()
	
public:
	UBeatManagerSubsystem() {}
	virtual void Initialize(FSubsystemCollectionBase& Collection) override;
};
