// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Engine/DataAsset.h"
#include "ComboMoveDataAsset.generated.h"

/** Enum of every possible move in combo system */
UENUM(BlueprintType, Blueprintable)
enum class ESpellMove : uint8
{
    VE_Up       UMETA(DisplayName = "Up"),
    VE_Right    UMETA(DisplayName = "Right"),
    VE_Down     UMETA(DisplayName = "Down"),
    VE_Left     UMETA(DisplayName = "Left"),
};

/**
 * 
 */
UCLASS(BlueprintType)
class PROJEKT_JEZ_API UComboMoveDataAsset : public UPrimaryDataAsset
{
	GENERATED_BODY()

public:
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    ESpellMove SpellMove;
};
