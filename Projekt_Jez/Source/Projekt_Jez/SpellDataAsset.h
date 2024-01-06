// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Engine/DataAsset.h"
#include "ComboMoveDataAsset.h"
#include "SpellDataAsset.generated.h"

/**
 * 
 */
UCLASS(BlueprintType)
class PROJEKT_JEZ_API USpellDataAsset : public UPrimaryDataAsset
{
	GENERATED_BODY()

public:
	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	TArray<TSubclassOf<UComboMoveDataAsset>> ComboSequence;
};
