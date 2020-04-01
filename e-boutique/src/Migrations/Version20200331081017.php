<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200331081017 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE command_line DROP FOREIGN KEY FK_70BE1A7B33E1689A');
        $this->addSql('CREATE TABLE command (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, order_number VARCHAR(12) NOT NULL, state VARCHAR(20) NOT NULL, date_time DATETIME NOT NULL, INDEX IDX_8ECAEAD4A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE command ADD CONSTRAINT FK_8ECAEAD4A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('DROP TABLE `order`');
        $this->addSql('ALTER TABLE command_line DROP FOREIGN KEY FK_70BE1A7B33E1689A');
        $this->addSql('ALTER TABLE command_line ADD CONSTRAINT FK_70BE1A7B33E1689A FOREIGN KEY (command_id) REFERENCES command (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE command_line DROP FOREIGN KEY FK_70BE1A7B33E1689A');
        $this->addSql('CREATE TABLE `order` (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, order_number VARCHAR(12) NOT NULL COLLATE utf8mb4_unicode_ci, state VARCHAR(20) NOT NULL COLLATE utf8mb4_unicode_ci, date_time DATETIME NOT NULL, INDEX IDX_F5299398A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE `order` ADD CONSTRAINT FK_F5299398A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('DROP TABLE command');
        $this->addSql('ALTER TABLE command_line DROP FOREIGN KEY FK_70BE1A7B33E1689A');
        $this->addSql('ALTER TABLE command_line ADD CONSTRAINT FK_70BE1A7B33E1689A FOREIGN KEY (command_id) REFERENCES `order` (id)');
    }
}
