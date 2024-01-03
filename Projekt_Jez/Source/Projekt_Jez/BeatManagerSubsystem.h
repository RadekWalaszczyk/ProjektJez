// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "MovieSceneSequencePlayer.h"
#include <LevelSequencePlayer.h>
#include "MovieSceneSequencePlayer.h"
#include "BeatManagerSubsystem.generated.h"

/** Struct handling songs */
USTRUCT(BlueprintType)
struct FSong
{
	GENERATED_BODY()
public:
	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	ULevelSequence* SongSequence;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	int32 BPM;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	int32 BeatOffset;
};

/**
 * 
 */
UCLASS(Abstract, Blueprintable, BlueprintType)
class PROJEKT_JEZ_API UBeatManagerSubsystem : public UGameInstanceSubsystem
{
	GENERATED_BODY()
	
public:
	UBeatManagerSubsystem() {}
	virtual void Initialize(FSubsystemCollectionBase& Collection) override;

	UFUNCTION(BlueprintImplementableEvent, BlueprintCallable)
	void PickSong();

public:
	/** Please add a variable description */
	UPROPERTY(BlueprintReadWrite, EditAnywhere, Category = "Songs")
	TArray<FSong> Songs;

	/** Margin of potential player's mistakes (in frames) */
	UPROPERTY(BlueprintReadWrite, EditDefaultsOnly, Category = "Settings")
	int32 BeatMargin;

	/** SequencePLayer as actor in world */
	ULevelSequencePlayer* CurrentLevelSequencePlayer;
};

