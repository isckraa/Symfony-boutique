<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CommandRepository")
 */
class Command
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=12)
     */
    private $orderNumber;

    /**
     * @ORM\Column(type="string", length=20)
     */
    private $state;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateTime;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="orders")
     */
    private $user;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\CommandLine", mappedBy="command")
     */
    private $commandLines;

    public function __construct()
    {
        $this->commandLines = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrderNumber(): ?string
    {
        return $this->orderNumber;
    }

    public function setOrderNumber(string $orderNumber): self
    {
        $this->orderNumber = $orderNumber;

        return $this;
    }

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(string $state): self
    {
        $this->state = $state;

        return $this;
    }

    public function getDateTime(): ?\DateTimeInterface
    {
        return $this->dateTime;
    }

    public function setDateTime(\DateTimeInterface $dateTime): self
    {
        $this->dateTime = $dateTime;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    /**
     * @return Collection|CommandLine[]
     */
    public function getCommandLines(): Collection
    {
        return $this->commandLines;
    }

    public function addCommandLine(CommandLine $commandLine): self
    {
        if (!$this->commandLines->contains($commandLine)) {
            $this->commandLines[] = $commandLine;
            $commandLine->setCommand($this);
        }

        return $this;
    }

    public function removeCommandLine(CommandLine $commandLine): self
    {
        if ($this->commandLines->contains($commandLine)) {
            $this->commandLines->removeElement($commandLine);
            // set the owning side to null (unless already changed)
            if ($commandLine->getCommand() === $this) {
                $commandLine->setCommand(null);
            }
        }

        return $this;
    }
}
