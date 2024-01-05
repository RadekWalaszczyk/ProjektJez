// Fill out your copyright notice in the Description page of Project Settings.


#include "BeatManagerSubsystem.h"
#include <LevelSequencePlayer.h>
#include <LevelSequenceActor.h>
#include "MovieSceneSequencePlayer.h"

void UBeatManagerSubsystem::Initialize(FSubsystemCollectionBase& Collection)
{

}

void UBeatManagerSubsystem::StartSong()
{
    if (Songs.Num() > 0)
    {
        FMovieSceneSequencePlaybackSettings settings;
        settings.bAutoPlay = true;
        settings.LoopCount.Value = -1;
        ALevelSequenceActor* actorOut;
        int32 randomSongIndex = FMath::RandRange(0, Songs.Num() - 1);
        CurrentLevelSequencePlayer = ULevelSequencePlayer::CreateLevelSequencePlayer(GetWorld(), Songs[randomSongIndex].SongSequence, settings, actorOut);
        CurrentBPM = Songs[randomSongIndex].BPM;
        CurrentBeatOffset = Songs[randomSongIndex].BeatOffset;

        UE_LOG(LogTemp, Warning, TEXT("Start playing song"));
    }
    else
    {
        UE_LOG(LogTemp, Warning, TEXT("There are now song to play in BeatManager"));
    }
}

//
void UBeatManagerSubsystem::TryCastSpell(bool& castSuccessful)
{
    int32 framesPerBeat = 60 / (CurrentBPM / 60);
    int32 pressedFrame = CheckLevelSequence();
    int32 calcualtedModulo = pressedFrame % framesPerBeat;
    int32 currentPressedBeat = (pressedFrame - calcualtedModulo) / framesPerBeat;

    if (currentPressedBeat == LastPressedBeat)
    {
        castSuccessful = false;
        return;
    }

    if (calcualtedModulo < BeatMargin + CurrentBeatOffset || framesPerBeat - (calcualtedModulo) < BeatMargin + CurrentBeatOffset)
    {
        LastPressedBeat = currentPressedBeat;
        castSuccessful = true;
    }
    else
        castSuccessful = false;
}



