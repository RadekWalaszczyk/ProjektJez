// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "LevelSequence.h"
#include "SongSequence.generated.h"

/**
 * 
 */
UCLASS(Blueprintable)
class PROJEKT_JEZ_API USongSequence : public UObject
{
	GENERATED_BODY()

	UPROPERTY(EditDefaultsOnly, Category = "Song")
	ULevelSequence* LevelSequenceWithSong;

	UPROPERTY(EditDefaultsOnly, Category = "Song")
	int32 BPM;

	/** Offset of the first beat in the song (in frames) */
	UPROPERTY(EditDefaultsOnly, Category = "Song")
	int32 BeatOffset;
};
