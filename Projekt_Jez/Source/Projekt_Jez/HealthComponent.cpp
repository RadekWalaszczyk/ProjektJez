// Fill out your copyright notice in the Description page of Project Settings.


#include "HealthComponent.h"

// Sets default values for this component's properties
UHealthComponent::UHealthComponent()
{
	PrimaryComponentTick.bCanEverTick = false;
}


// Called when the game starts
void UHealthComponent::BeginPlay()
{
	Super::BeginPlay();

	Health = MaxHealth;
	OnHealthChanged.Broadcast();
}


// Called every frame
void UHealthComponent::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);
}

/** Deal damage to component owner */
void UHealthComponent::Damage(int32 damage)
{
	Health -= damage;
	Health = FMath::Clamp(Health, 0, MaxHealth);

	OnHealthChanged.Broadcast();

	if (Health <= 0)
	{
		OnDead.Broadcast();
	}
}

