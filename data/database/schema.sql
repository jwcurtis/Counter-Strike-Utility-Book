Create Table maps (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    displayName VARCHAR(255) NOT NULL,
);

Create Table utilities (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    displayName VARCHAR(64) NOT NULL,

    type ENUM('smoke', 'flash', 'molotov', 'grenade') NOT NULL,
    side ENUM('T', 'CT') NOT NULL,
    site ENUM('A', 'B', 'Mid'),

    landingPosition VARCHAR(255) NOT NULL,
    landingSite ENUM('A', 'B', 'Mid'),


    throwType ENUM('normal', 'jumpthrow', 'runthrow') NOT NULL
    throwPosition VARCHAR(255) NOT NULL,
    throwDescription VARCHAR(255) NOT NULL,

    Foreign Key (mapId) References maps(id)
);

Create Table tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
);

Create Table utility_tags (
    utilityId INT NOT NULL,
    tagId INT NOT NULL,

    Foreign Key (utilityId) References utilities(id),
    Foreign Key (tagId) References tags(id)
);

Create Table utility_media (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilityId INT NOT NULL,
    type ENUM('image', 'video') NOT NULL,
    mediaPath VARCHAR(255) NOT NULL,

    Foreign Key (utilityId) References utilities(id)
);

Create Table utility_practice(
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilityId INT NOT NULL,
    isSuccessful BOOLEAN NOT NULL,
    attemptDate DATETIME NOT NULL,

    Foreign Key (utilityId) References utilities(id)
)