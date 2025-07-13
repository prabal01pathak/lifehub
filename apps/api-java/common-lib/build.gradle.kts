plugins {
	java
	id("org.springframework.boot") version "3.5.3" apply false
	id("io.spring.dependency-management") version "1.1.7"
	id("maven-publish")
}

group = "com.lifehub.common"
version = "0.0.1-SNAPSHOT"

java {
	toolchain {
		languageVersion = JavaLanguageVersion.of(17)
	}
}

repositories {
	mavenCentral()
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter-data-jpa")
//	implementation("org.springframework.boot:spring-boot-starter-security")
	runtimeOnly("org.postgresql:postgresql")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
//	testImplementation("org.springframework.security:spring-security-test")
	testRuntimeOnly("org.junit.platform:junit-platform-launcher")
//	implementation("org.xerial:sqlite-jdbc:3.45.1.0")
//	implementation("com.github.gwenn:sqlite-dialect:0.1.2")

	// Lombok
	compileOnly("org.projectlombok:lombok:1.18.30")
	annotationProcessor("org.projectlombok:lombok:1.18.30")

	// Jakarta JPA
	implementation("jakarta.persistence:jakarta.persistence-api:3.1.0")
	implementation("com.h2database:h2:2.2.224")

}

tasks.withType<Test> {
	useJUnitPlatform()
}

dependencyManagement {
	imports {
		mavenBom(org.springframework.boot.gradle.plugin.SpringBootPlugin.BOM_COORDINATES)
	}
}
publishing {
	publications {
		create<MavenPublication>("mavenJava") {
			artifact(tasks.getByName("jar"))
		}
	}
}
